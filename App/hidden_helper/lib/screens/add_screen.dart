import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_helper/models/Note.dart';
import 'package:hidden_helper/screens/sos_screen.dart';
import 'package:hive/hive.dart';
import 'package:hidden_helper/screens/form.dart';
import 'package:intl/intl.dart';
import 'package:get_mac/get_mac.dart';


class NewNoteForm extends StatefulWidget {
  @override
  _NewNoteFormState createState() => _NewNoteFormState();
}

class _NewNoteFormState extends State<NewNoteForm> {
  final _formKey = GlobalKey<FormState>();

  String _title;
  String _description;
  String _platformVersion = 'Unknown';


  void addNote(Note note) async {
    String platformVersion;
    print('Title: ${note.title}, Description: ${note.description} , Date: ${note.date} ' );
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    if(note.title == 'Password' ){
      print('Password Entered');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormScreen()),
      );
    }
    else if(note.title == 'SOS'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SOSScreen()),
      );
    }
    else{
      final notesBox = Hive.box('NotesBox');
      notesBox.add(note);
      print(_platformVersion);
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onSaved: (value) => _title = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onSaved: (value) => _description = value,
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Add Note'),
            onPressed: () {
              _formKey.currentState.save();
              String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
              final note = Note( _title, _description, now );
              addNote(note);
            },
          ),
        ],
      ),
    );
  }
}