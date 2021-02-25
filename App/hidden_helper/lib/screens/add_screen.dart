import 'package:flutter/material.dart';
import 'package:hidden_helper/models/NotesOperation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String titleText;
    String descriptionText;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF568889),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Title',
                      hintStyle: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)
                ),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
                onChanged:(value){
                  titleText = value;
                },
              ),
              Expanded(
                child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Description',
                    hintStyle: TextStyle(fontSize: 18,
                        color: Colors.black54)
                ),
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54),
                  onChanged:(value){
                    descriptionText = value;
                  },
                ),
              ),
              FlatButton(
                  onPressed: (){
                    Provider.of<NotesOperation>(context, listen: false).addNewNote(titleText, descriptionText, context);
                  },
                  color: Color(0xFF568889),
                child: Text('Add Note', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              )
            ],
        ),
      ),
    );
  }
}