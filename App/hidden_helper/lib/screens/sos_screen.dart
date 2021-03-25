import 'package:flutter/material.dart';
import 'package:hidden_helper/screens/home_screen.dart';

class SOSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('SOS'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF568889),
        ),
        body:Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Text(
                'SOS has been activated',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.bold)
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                color: Color(0xFF568889),
                child: Text('Go Home', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              )
            ]
        ),
        ),
    );
  }
}

