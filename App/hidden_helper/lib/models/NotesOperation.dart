import 'package:flutter/material.dart';
import 'package:hidden_helper/screens/form.dart';
import 'package:hidden_helper/screens/home_screen.dart';
import 'package:hidden_helper/screens/sos_screen.dart';
import 'Note.dart';


class NotesOperation extends ChangeNotifier{
  List<Note> _notes = new List<Note>();

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation(){
    //addNewNote('First Note', 'First Note Description');
  }

  void addNewNote(String title, String description , BuildContext context){
    if(title == 'Password'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormScreen()),
      );
    }
    else if( title == 'SOS'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SOSScreen()),
      );
    }
    else {
      Note note = Note(title, description);
      _notes.add(note);
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

}