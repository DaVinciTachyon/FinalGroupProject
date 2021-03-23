import 'package:flutter/material.dart';
import 'package:hidden_helper/models/Note.dart';
import 'package:hidden_helper/screens/add_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hidden_helper/screens/add_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({
    Key key,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('test');
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewNoteForm()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF568889),
      ),
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF568889),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildListView()),
        ],
      ),
    );
  }

  Widget _buildListView() {
  // ignore: deprecated_member_use
  return WatchBoxBuilder(
      box: Hive.box('NotesBox'),
      builder: (context, notesBox){
      return ListView.builder(
        itemCount: notesBox.length,
        itemBuilder: (context, index){
          final note = notesBox.getAt(index) as Note;
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      notesBox.deleteAt(index);
                    }
                )],
            ),
          );
        },
      );
    });
  }
}
