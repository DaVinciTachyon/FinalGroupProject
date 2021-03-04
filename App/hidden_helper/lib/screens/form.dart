import 'package:flutter/material.dart';
import 'package:hidden_helper/models/AbuseForm.dart';
import 'package:hidden_helper/models/FormsOperation.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final incidentDateController = TextEditingController();
  final attentionDateController = TextEditingController();

  List<String> genderList = GenderEnum.values.map((gender) {
    return gender.toGenderString();
  }).toList();

  List<String> ageRangeList = AgeRangeEnum.values.map((age) {
    return age.toNumberString();
  }).toList();

  List<String> seekedAttentionList =
      SeekedAttentionEnum.values.map((attention) {
    return attention.toSeekedAttentionString();
  }).toList();

  List<String> offeredAttentionList =
      OfferedAttentionEnum.values.map((attention) {
    return attention.toOfferedAttentionString();
  }).toList();

  List<String> referredAttentionList =
      ReferredAttentionEnum.values.map((attention) {
    return attention.toReferredAttentionString();
  }).toList();

  List<String> physicalAbuseList =
      PhysicalAbuseClassificationEnum.values.map((abuse) {
    return abuse.toPhysicalAbuseClassificationString();
  }).toList();

  List<String> psychologicalAbuseList =
      PsychologicalAbuseClassificationEnum.values.map((abuse) {
    return abuse.toPsychologicalAbuseClassificationString();
  }).toList();

  List<String> sexualAbuseList =
      SexualAbuseClassificationEnum.values.map((abuse) {
    return abuse.toSexualAbuseClassificationString();
  }).toList();

  List<String> booleanOptions = ["Yes", "No"];

  List<String> rightsDeniedList = RightsEnum.values.map((right) {
    return right.toRightsString();
  }).toList();

  List<String> relationshipList = RelationshipEnum.values.map((relationship) {
    return relationship.toRelationshipString();
  }).toList();

  _showSelectDialog(context, isRadio, theList, headingText) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(headingText),
            content: MultiSelect(theList, isRadio),
            actions: <Widget>[
              FlatButton(
                child: Text("Okay"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var incidentDate, attentionDate;
    GenderEnum victimGender;
    AgeRangeEnum victimAgeRange;
    String municipality;
    String community;

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
          body: ListView(
            children: <Widget>[
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
                    TextField(
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
                    TextField(
                      readOnly: true,
                      controller: incidentDateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Incident Date',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () async {
                        incidentDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        incidentDateController.text =
                            incidentDate.toString().substring(0, 10);
                      },
                    ),
                    TextField(
                      readOnly: true,
                      controller: attentionDateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Attention Date',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () async {
                        attentionDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        attentionDateController.text =
                            attentionDate.toString().substring(0, 10);
                      },
                    ),
                    RaisedButton(
                      child: Text("Victim Gender"),
                      onPressed: () => _showSelectDialog(
                          context, true, genderList, "Victim Gender"),
                    ),
                    RaisedButton(
                      child: Text("Victim Age Range"),
                      onPressed: () => _showSelectDialog(
                          context, true, ageRangeList, "Victim Age Range"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Municipality',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      onChanged: (value) {
                        municipality = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Community',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      onChanged: (value) {
                        community = value;
                      },
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Seeked Attention"),
                      onPressed: () => _showSelectDialog(context, false,
                          seekedAttentionList, "Seeked Attention"),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Offered Attention"),
                      onPressed: () => _showSelectDialog(context, false,
                          offeredAttentionList, "Offered Attention"),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Referred Attention"),
                      onPressed: () => _showSelectDialog(context, false,
                          referredAttentionList, "Referred Attention"),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Physical Abuse"),
                      onPressed: () => _showSelectDialog(
                          context, false, physicalAbuseList, "Physical Abuse"),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Psychological Abuse"),
                      onPressed: () => _showSelectDialog(context, false,
                          psychologicalAbuseList, "Psychological Abuse"),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Sexual Abuse"),
                      onPressed: () => _showSelectDialog(
                          context, false, sexualAbuseList, "Sexual Abuse"),
                    ),
                    RaisedButton(
                      child: Text("Forced Marriage"),
                      onPressed: () => _showSelectDialog(
                          context, true, booleanOptions, "Forced Marriage"),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Rights Denied"),
                      onPressed: () => _showSelectDialog(
                          context, false, rightsDeniedList, "Rights Denied"),
                    ),
                    RaisedButton(
                      child: Text("Perpetrator Gender"),
                      onPressed: () => _showSelectDialog(
                          context, true, genderList, "Perpetrator Gender"),
                    ),
                    RaisedButton(
                      child: Text("Perpetrator Is Known"),
                      onPressed: () => _showSelectDialog(context, true,
                          booleanOptions, "Perpetrator Is Known"),
                    ),
                    RaisedButton(
                      child: Text("Perpetrator Relationship"),
                      onPressed: () => _showSelectDialog(context, true,
                          relationshipList, "Perpetrator Relationship"),
                    ),
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

class MultiSelect extends StatefulWidget {
  List<String> selectList = [];
  final Function(List<String>) onSelectionChanged;
  final bool isRadio;

  MultiSelect(this.selectList, this.isRadio, {this.onSelectionChanged});

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedChoices = List();
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.selectList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              if (!widget.isRadio) {
                selectedChoices.contains(item)
                    ? selectedChoices.remove(item)
                    : selectedChoices.add(item);
              } else {
                selectedChoices = [item];
              }
              if (widget.onSelectionChanged != null) {
                widget.onSelectionChanged(selectedChoices);
              }
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
