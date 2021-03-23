import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_helper/models/Note.dart';
import 'package:hidden_helper/screens/sos_screen.dart';
import 'package:hive/hive.dart';
import 'package:hidden_helper/screens/form.dart';
import 'package:intl/intl.dart';
import 'package:get_mac/get_mac.dart';

import 'home_screen.dart';

class IndividualNote extends StatefulWidget {
  final Note noteInfo;

  IndividualNote({
    Key key,
    @required this.noteInfo,
  }) : super(key: key);

  @override
  _IndividualNoteState createState() => _IndividualNoteState();
}

class _IndividualNoteState extends State<IndividualNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.noteInfo.title.toString()),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF568889),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child:
          Text( widget.noteInfo.description.toString(),
            style: TextStyle(fontSize: 18),)
        ));
  }

}