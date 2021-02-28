import 'package:flutter/material.dart';
import 'package:hidden_helper/models/AbuseForm.dart';
import 'package:hidden_helper/models/FormsOperation.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String type;
    String location;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text('Submit Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Text('Past Submissions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            title: Text('Form'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xFF568889),
          ),
          body: TabBarView(
            children: [
              // Form Submission, going to move this to its own widget (similar to the pastSubmissions widget below)
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter the type of abuse.',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      onChanged: (value) {
                        type = value;
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter the location of the abuse.',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black54)),
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      readOnly: true,
                      controller: dateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Incident Date',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        dateController.text = date.toString().substring(0, 10);
                      },
                    )),
                    FlatButton(
                      onPressed: () {
                        Provider.of<FormsOperation>(context, listen: false)
                            .addNewForm(type, location);
                      },
                      color: Color(0xFF568889),
                      child: Text('Submit Form',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              Text('Past Submissions')
            ],
          ),
        ),
      ),
    );
  }
}

class PastSubmissions extends StatelessWidget {
  final AbuseForm form;
  PastSubmissions(this.form);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            form.type,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Text(form.location, style: TextStyle(fontSize: 17))
        ]));
  }
}
