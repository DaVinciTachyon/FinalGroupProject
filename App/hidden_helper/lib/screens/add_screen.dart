import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_helper/models/Note.dart';
// import 'package:hidden_helper/screens/sos_screen.dart';
import 'package:hive/hive.dart';
import 'package:hidden_helper/screens/form.dart';
import 'package:intl/intl.dart';
import 'package:get_mac/get_mac.dart';
import 'package:location/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home_screen.dart';

class NewNoteForm extends StatefulWidget {
  static final TOKEN_KEY = 'token_key';
  @override
  _NewNoteFormState createState() => _NewNoteFormState();
}

class _NewNoteFormState extends State<NewNoteForm> {
  final _formKey = GlobalKey<FormState>();
  String userPwd = "Secrets";
  String sosCode = 'sos';
  String _title;
  String _description;
  String _platformVersion = 'Unknown';

  void addNote(Note note) async {
    String platformVersion;
    print(
        'Title: ${note.title}, Description: ${note.description} , Date: ${note.date} ');
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: NewNoteForm.TOKEN_KEY);



    var url = Uri.parse('https://db.sdart.ie/api/monitor/login/');
    var loginDetails = {
      'email': note.title,
      'password': note.description,
      'macAddress': platformVersion
    };


     var response = await http.post(url,
          body: jsonEncode(loginDetails),
          headers: {'Content-Type': 'application/json'});
      print(response.statusCode);
      print(response.reasonPhrase);
      print('Response body: ${response.body}');


    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    if (response.statusCode == 200) {
      print('Password Entered');
      final storage = new FlutterSecureStorage();
      await storage.write(
          key: NewNoteForm.TOKEN_KEY,
          value: jsonDecode(response.body)['token']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormScreen()),
      );
    } else if (note.title == sosCode) {
      print("SOS entered");
      final storage = new FlutterSecureStorage();
      String token = await storage.read(key: NewNoteForm.TOKEN_KEY);

      LocationData _locationData;

      _locationData = await location.getLocation();
      print(_locationData);

      var url = Uri.parse('https://db.sdart.ie/api/monitor/sos/');
      var response = await http.post(url,
          body: jsonEncode({"macAddress": platformVersion}),
          headers: {'Content-Type': 'application/json'});
      print(jsonEncode({"macAddress": platformVersion}));
      print(response.statusCode);
      print(response.reasonPhrase);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "SOS sent with GPS location.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "API failure - will retry.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SOSScreen()),
      // );
      } else if (token.isNotEmpty && response.statusCode != 200) {
      print("token exists");
      print(token);
      var noteDetails = {
        'content': note.description,
      };
      var url = Uri.parse('https://db.sdart.ie/api/notes/');
      var response = await http.post(url,
          body: jsonEncode(noteDetails),
          headers: {'Content-Type': 'application/json', 'auth-token': token});
      print(jsonEncode(noteDetails));
      print(response.statusCode);
      print(response.reasonPhrase);
      final notesBox = Hive.box('NotesBox');
      notesBox.add(note);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (response.statusCode != 200){
      final notesBox = Hive.box('NotesBox');
      notesBox.add(note);
      print(_platformVersion);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add a new Note'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF568889),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Title',
                      border: OutlineInputBorder()),
                  onSaved: (value) => _title = value,
                ),
                SizedBox(
                  height: 20,
                ),
                //SizedBox(width: 10),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description',
                      border: OutlineInputBorder()),
                  onSaved: (value) => _description = value,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton(
                    child: Text("Add Note"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF568889),
                      elevation: 20,
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      String now =
                          DateFormat("dd-MM-yyyy").format(DateTime.now());
                      final note = Note(_title, _description, now);
                      addNote(note);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
