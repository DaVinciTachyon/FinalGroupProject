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

  List<String> booleanYesNo = ["Yes", "No"];

  List<String> rightsDeniedList = RightsEnum.values.map((right) {
    return right.toRightsString();
  }).toList();

  List<String> relationshipList = RelationshipEnum.values.map((relationship) {
    return relationship.toRelationshipString();
  }).toList();

  _showSelectDialog(BuildContext context, bool isRadio, List<String> theList, List<String> selectedList,
      String headingText, onSelectionChange) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(headingText),
            content: MultiSelect(theList, isRadio, selectedList,
                onSelectionChange),
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
    var abuseForm = AbuseForm();

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
                      readOnly: true,
                      controller: incidentDateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Incident Date',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () async {
                        abuseForm.incidentDate = await showDatePicker(
                            context: context,
                            initialDate: abuseForm.incidentDate == null
                                ? DateTime.now()
                                : abuseForm.incidentDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        incidentDateController.text =
                            abuseForm.incidentDate.toString().split(" ")[0];
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
                        abuseForm.attentionDate = await showDatePicker(
                            context: context,
                            initialDate: abuseForm.attentionDate == null
                                ? DateTime.now()
                                : abuseForm.attentionDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        attentionDateController.text =
                            abuseForm.attentionDate.toString().split(" ")[0];
                      },
                    ),
                    RaisedButton(
                      child: Text("Victim Gender"),
                      onPressed: () => _showSelectDialog(
                          context,
                          true,
                          genderList,
                          nonNullList([abuseForm.gender.toGenderString()]),
                          "Victim Gender",
                          (gender) {
                                abuseForm.gender =
                                    genderFromString(gender);
                              }),
                    ),
                    RaisedButton(
                        child: Text("Victim Age Range"),
                        onPressed: () => _showSelectDialog(
                            context,
                            true,
                            ageRangeList,
                            nonNullList([abuseForm.ageRange.toNumberString()]),
                            "Victim Age Range",
                            (item) => {
                                  abuseForm.ageRange = parseAgeFromString(item)
                                })),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Municipality',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      onChanged: (value) {
                        abuseForm.municipality = value;
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
                        abuseForm.community = value;
                      },
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Seeked Attention"),
                      onPressed: () => _showSelectDialog(
                          context,
                          false,
                          seekedAttentionList,
                          abuseForm.seekedAttention
                              .map((e) => e.toSeekedAttentionString()).toList(),
                          "Seeked Attention", (attention) {
                        abuseForm.seekedAttention.toggleElement(
                            seekedAttentionFromString(attention));
                      }),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Offered Attention"),
                      onPressed: () => _showSelectDialog(
                          context,
                          false,
                          offeredAttentionList,
                          abuseForm.offeredAttention
                              .map((e) => e.toOfferedAttentionString()).toList(),
                          "Offered Attention", (attention) {
                        abuseForm.offeredAttention.toggleElement(
                            offeredAttentionFromString(attention));
                      }),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Referred Attention"),
                      onPressed: () => _showSelectDialog(
                          context,
                          false,
                          referredAttentionList,
                          abuseForm.referredAttention
                              .map((e) => e.toReferredAttentionString()).toList(),
                          "Referred Attention", (attention) {
                        abuseForm.referredAttention.toggleElement(
                            referredAttentionFromString(attention));
                      }),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Physical Abuse"),
                      onPressed: () => _showSelectDialog(
                          context,
                          false,
                          physicalAbuseList,
                          abuseForm.physicalAbuse.map(
                              (e) => e.toPhysicalAbuseClassificationString()).toList(),
                          "Physical Abuse", (abuse) {
                        abuseForm.physicalAbuse.toggleElement(physicalAbuseFromString(
                            abuse));
                      }),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Psychological Abuse"),
                      onPressed: () => _showSelectDialog(
                          context,
                          false,
                          psychologicalAbuseList,
                          abuseForm.psychologicalAbuse.map((e) =>
                              e.toPsychologicalAbuseClassificationString()).toList(),
                          "Psychological Abuse", (abuse) {
                        abuseForm.psychologicalAbuse.toggleElement(
                            psychologicalAbuseFromString(
                                abuse));
                      }),
                    ),
                    RaisedButton(
                      //TODO add 'other' type bar
                      child: Text("Sexual Abuse"),
                      onPressed: () => _showSelectDialog(
                          context,
                          false,
                          sexualAbuseList,
                          abuseForm.sexualAbuse.map(
                              (e) => e.toSexualAbuseClassificationString()).toList(),
                          "Sexual Abuse", (abuse) {
                        abuseForm.sexualAbuse.toggleElement(sexualAbuseFromString(
                            abuse));
                      }),
                    ),
                    RaisedButton(
                      child: Text("Forced Marriage"),
                      onPressed: () => _showSelectDialog(
                          context,
                          true,
                          booleanYesNo,
                          [parseBooleanToYesNo(abuseForm.forcedMarriage)],
                          "Forced Marriage", (yesNo) {
                        abuseForm.forcedMarriage = parseYesNoToBoolean(yesNo);
                      }),
                    ),
                    RaisedButton(
                        //TODO add 'other' type bar
                        child: Text("Rights Denied"),
                        onPressed: () => _showSelectDialog(
                                context,
                                false,
                                rightsDeniedList,
                                abuseForm.rightsDenied
                                    .map((e) => e.toRightsString()).toList(),
                                "Rights Denied", (right) {
                              abuseForm.rightsDenied.toggleElement(
                                  rightsFromString(right));
                            })),
                    RaisedButton(
                      child: Text("Perpetrator Gender"),
                      onPressed: () => _showSelectDialog(
                          context,
                          true,
                          genderList,
                          nonNullList([abuseForm.perpetrator.gender.toGenderString()]),
                          "Perpetrator Gender", (gender) {
                        abuseForm.perpetrator.gender =
                            genderFromString(gender);
                      }),
                    ),
                    RaisedButton(
                      child: Text("Perpetrator Is Known"),
                      onPressed: () => _showSelectDialog(
                          context,
                          true,
                          booleanYesNo,
                          nonNullList([parseBooleanToYesNo(abuseForm.perpetrator.isKnown)]),
                          "Perpetrator Is Known", (yesNo) {
                        abuseForm.perpetrator.isKnown =
                            parseYesNoToBoolean(yesNo);
                      }),
                    ),
                    RaisedButton(
                      child: Text("Perpetrator Relationship"),
                      onPressed: () => _showSelectDialog(
                          context,
                          true,
                          relationshipList,
                          [
                            abuseForm.perpetrator.relationshipToVictim
                                .toRelationshipString()
                          ],
                          "Perpetrator Relationship", (relationship) {
                        abuseForm.perpetrator.relationshipToVictim =
                            relationshipFromString(relationship);
                      }),
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
          // Text(
          //   form.type,
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   overflow: TextOverflow.ellipsis,
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // Text(form.location, style: TextStyle(fontSize: 17))
        ]));
  }
}

class MultiSelect extends StatefulWidget {
  List<String> selectList = List();
  List<String> selectedChoices = List();
  final Function(String) onSelectionChanged;
  final bool isRadio;

  MultiSelect(this.selectList, this.isRadio, this.selectedChoices,
      this.onSelectionChanged) {
    this.selectedChoices =
        this.selectedChoices == null ? [] : this.selectedChoices;
  }

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.selectList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: widget.selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              if (!widget.isRadio) {
                widget.selectedChoices.toggleElement(item);
              } else {
                widget.selectedChoices = [item];
              }
            });
            if (widget.onSelectionChanged != null) {
              widget.onSelectionChanged(item);
            }
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
