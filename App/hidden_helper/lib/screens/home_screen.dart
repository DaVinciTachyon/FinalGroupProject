import 'package:flutter/material.dart';
import 'package:hidden_helper/models/NotesOperation.dart';
import 'package:hidden_helper/models/Note.dart';
import 'package:provider/provider.dart';

import 'add_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen()));
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
      body: Consumer<NotesOperation>(
        builder: (context,NotesOperation data, child){
            return ListView.builder(
              itemCount: data.getNotes.length,
              itemBuilder: (context, index ){
                return NotesCard(data.getNotes[index]);
              },
            );
        },
      )
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( bottom: 0),
      padding: EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        //borderRadius: BorderRadius.circular(5)
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(note.date, style: TextStyle(fontSize: 15, color: Colors.blueGrey), ),
          Text(note.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),  overflow: TextOverflow.ellipsis,),
          SizedBox(
            height: 5,
          ),
          Text(note.description, style: TextStyle(fontSize: 17),  overflow: TextOverflow.ellipsis,)
        ]
      )
    );
  }
}