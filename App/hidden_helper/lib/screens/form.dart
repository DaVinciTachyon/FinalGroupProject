import 'package:flutter/material.dart';
import 'package:hidden_helper/models/AbuseForm.dart';
import 'package:hidden_helper/models/FormsOperation.dart';

class FormScreen extends StatefulWidget {
  final incidentDateController = TextEditingController();
  final attentionDateController = TextEditingController();
  final victimGenderTextController = TextEditingController();
  final victimAgeTextController = TextEditingController();
  final municipalityController = TextEditingController();
  final communityController = TextEditingController();
  final seekedAttentionController = TextEditingController();
  final offeredAttentionController = TextEditingController();
  final referredAttentionController = TextEditingController();
  final physicalAbuseController = TextEditingController();
  final psychologicalAbuseController = TextEditingController();
  final sexualAbuseController = TextEditingController();
  final forcedMarriageController = TextEditingController();
  final rightsDeniedController = TextEditingController();
  final perpGenderController = TextEditingController();
  final perpKnownController = TextEditingController();
  final perpRelationshipController = TextEditingController();

  final communityKey = Key("community");
  final municipalityKey = Key("municipality");

  final List<String> genderList = GenderEnum.values.map((gender) {
    return gender.toGenderString();
  }).toList();

  final List<String> ageRangeList = AgeRangeEnum.values.map((age) {
    return age.toNumberString();
  }).toList();

  final List<String> seekedAttentionList =
      SeekedAttentionEnum.values.map((attention) {
    return attention.toSeekedAttentionString();
  }).toList();

  final List<String> offeredAttentionList =
      OfferedAttentionEnum.values.map((attention) {
    return attention.toOfferedAttentionString();
  }).toList();

  final List<String> referredAttentionList =
      ReferredAttentionEnum.values.map((attention) {
    return attention.toReferredAttentionString();
  }).toList();

  final List<String> physicalAbuseList =
      PhysicalAbuseClassificationEnum.values.map((abuse) {
    return abuse.toPhysicalAbuseClassificationString();
  }).toList();

  final List<String> psychologicalAbuseList =
      PsychologicalAbuseClassificationEnum.values.map((abuse) {
    return abuse.toPsychologicalAbuseClassificationString();
  }).toList();

  final List<String> sexualAbuseList =
      SexualAbuseClassificationEnum.values.map((abuse) {
    return abuse.toSexualAbuseClassificationString();
  }).toList();

  final List<String> booleanYesNo = ["Yes", "No"];

  final List<String> rightsDeniedList = RightsEnum.values.map((right) {
    return right.toRightsString();
  }).toList();

  final List<String> relationshipList =
      RelationshipEnum.values.map((relationship) {
    return relationship.toRelationshipString();
  }).toList();

  var abuseForm = AbuseForm();

  @override
  State<StatefulWidget> createState() => FormContentState();

  _showSelectDialog(BuildContext context, bool isRadio, List<String> theList,
      List<String> selectedList, String headingText, onSelectionChange) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(headingText),
            content:
                MultiSelect(theList, isRadio, selectedList, onSelectionChange),
            actions: <Widget>[
              TextButton(
                child: Text("Okay"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}

//TODO should probably convert this to a generated list
class FormContentState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.incidentDateController,
                          decoration: InputDecoration(
                              labelText: 'Incident Date',
                              hintText: 'Incident Date',
                              border: OutlineInputBorder()),
                          onTap: () async {
                            widget.abuseForm.incidentDate =
                                await showDatePicker(
                                    context: context,
                                    initialDate:
                                        widget.abuseForm.incidentDate == null
                                            ? DateTime.now()
                                            : widget.abuseForm.incidentDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                            widget.incidentDateController.text = widget
                                .abuseForm.incidentDate
                                .toString()
                                .split(" ")[0];
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.attentionDateController,
                          decoration: InputDecoration(
                              labelText: 'Attention Date',
                              hintText: 'Attention Date',
                              border: OutlineInputBorder()),
                          onTap: () async {
                            widget.abuseForm.attentionDate =
                                await showDatePicker(
                                    context: context,
                                    initialDate:
                                        widget.abuseForm.attentionDate == null
                                            ? DateTime.now()
                                            : widget.abuseForm.attentionDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                            widget.attentionDateController.text = widget
                                .abuseForm.attentionDate
                                .toString()
                                .split(" ")[0];
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.victimGenderTextController,
                          decoration: InputDecoration(
                              labelText: 'Victim Gender',
                              hintText: 'Victim Gender',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              true,
                              widget.genderList,
                              nonNullList(
                                  [widget.abuseForm.gender.toGenderString()]),
                              "Victim Gender", (gender) {
                            widget.abuseForm.gender = genderFromString(gender);
                            widget.victimGenderTextController.text = gender;
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                            readOnly: true,
                            controller: widget.victimAgeTextController,
                            decoration: InputDecoration(
                                labelText: 'Victim Age',
                                hintText: 'Victim Age',
                                border: OutlineInputBorder()),
                            onTap: () => widget._showSelectDialog(
                                    context,
                                    true,
                                    widget.ageRangeList,
                                    nonNullList([
                                      widget.abuseForm.ageRange.toNumberString()
                                    ]),
                                    "Victim Age Range", (age) {
                                  widget.abuseForm.ageRange =
                                      parseAgeFromString(age);
                                  widget.victimAgeTextController.text = age;
                                }))),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: widget.municipalityController,
                          decoration: InputDecoration(
                              labelText: 'Municipality',
                              hintText: 'Municipality',
                              border: OutlineInputBorder()),
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                          onChanged: (value) {
                            widget.abuseForm.municipality = value;
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: widget.communityController,
                          decoration: InputDecoration(
                              labelText: 'Community',
                              hintText: 'Community',
                              border: OutlineInputBorder()),
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                          onChanged: (value) {
                            widget.abuseForm.community = value;
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.seekedAttentionController,
                          decoration: InputDecoration(
                              labelText: 'Seeked Attention',
                              hintText: 'Seeked Attention',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.seekedAttentionList,
                              widget.abuseForm.seekedAttention
                                  .map((e) => e.toSeekedAttentionString())
                                  .toList(),
                              "Seeked Attention", (attention) {
                            widget.abuseForm.seekedAttention.toggleElement(
                                seekedAttentionFromString(attention));
                            widget.seekedAttentionController.text = widget
                                .abuseForm.seekedAttention
                                .map((attention) {
                                  return attention.toSeekedAttentionString();
                                })
                                .toString()
                                .replaceAll(new RegExp(r'[()]'), "");
                            setState(() {});
                          }),
                        )),
                    Visibility(
                        visible: widget.abuseForm.seekedAttention
                            .contains(SeekedAttentionEnum.other),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: 'Other Attention Seeked',
                                hintText: 'Other Attention Seeked',
                                border: OutlineInputBorder()),
                            // style: TextStyle(fontSize: 18, color: Colors.black87),
                            onChanged: (value) {
                              widget.abuseForm.seekedAttentionOther = value;
                            },
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.offeredAttentionController,
                          decoration: InputDecoration(
                              labelText: 'Offered Attention',
                              hintText: 'Offered Attention',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.offeredAttentionList,
                              widget.abuseForm.offeredAttention
                                  .map((e) => e.toOfferedAttentionString())
                                  .toList(),
                              "Offered Attention", (attention) {
                            widget.abuseForm.offeredAttention.toggleElement(
                                offeredAttentionFromString(attention));
                            widget.offeredAttentionController.text = widget
                                .abuseForm.offeredAttention
                                .map((attention) {
                                  return attention.toOfferedAttentionString();
                                })
                                .toString()
                                .replaceAll(new RegExp(r'[()]'), "");
                            setState(() {});
                          }),
                        )),
                    Visibility(
                        visible: widget.abuseForm.offeredAttention
                            .contains(OfferedAttentionEnum.other),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: 'Other Attention Offered',
                                hintText: 'Other Attention Offered',
                                border: OutlineInputBorder()),
                            // style: TextStyle(fontSize: 18, color: Colors.black87),
                            onChanged: (value) {
                              widget.abuseForm.offeredAttentionOther = value;
                            },
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.referredAttentionController,
                          decoration: InputDecoration(
                              labelText: 'Referred Attention',
                              hintText: 'Referred Attention',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.referredAttentionList,
                              widget.abuseForm.referredAttention
                                  .map((e) => e.toReferredAttentionString())
                                  .toList(),
                              "Referred Attention", (attention) {
                            widget.abuseForm.referredAttention.toggleElement(
                                referredAttentionFromString(attention));
                            widget.referredAttentionController.text = widget
                                .abuseForm.referredAttention
                                .map((attention) {
                                  return attention.toReferredAttentionString();
                                })
                                .toString()
                                .replaceAll(new RegExp(r'[()]'), "");
                            setState(() {});
                          }),
                        )),
                    Visibility(
                        visible: widget.abuseForm.referredAttention
                            .contains(ReferredAttentionEnum.other),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: 'Other Attention Referred',
                                hintText: 'Other Attention Referred',
                                border: OutlineInputBorder()),
                            // style: TextStyle(fontSize: 18, color: Colors.black87),
                            onChanged: (value) {
                              widget.abuseForm.referredAttentionOther = value;
                            },
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.physicalAbuseController,
                          decoration: InputDecoration(
                              labelText: 'Physical Abuse',
                              hintText: 'Physical Abuse',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.physicalAbuseList,
                              widget.abuseForm.physicalAbuse
                                  .map((e) =>
                                      e.toPhysicalAbuseClassificationString())
                                  .toList(),
                              "Physical Abuse", (abuse) {
                            widget.abuseForm.physicalAbuse
                                .toggleElement(physicalAbuseFromString(abuse));
                            widget.physicalAbuseController.text =
                                widget.abuseForm.physicalAbuse
                                    .map((attention) {
                                      return attention
                                          .toPhysicalAbuseClassificationString();
                                    })
                                    .toString()
                                    .replaceAll(new RegExp(r'[()]'), "");
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.psychologicalAbuseController,
                          decoration: InputDecoration(
                              labelText: 'Psychological Abuse',
                              hintText: 'Psychological Abuse',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.psychologicalAbuseList,
                              widget.abuseForm.psychologicalAbuse
                                  .map((e) => e
                                      .toPsychologicalAbuseClassificationString())
                                  .toList(),
                              "Psychological Abuse", (abuse) {
                            widget.abuseForm.psychologicalAbuse.toggleElement(
                                psychologicalAbuseFromString(abuse));
                            widget.psychologicalAbuseController.text =
                                widget.abuseForm.psychologicalAbuse
                                    .map((attention) {
                                      return attention
                                          .toPsychologicalAbuseClassificationString();
                                    })
                                    .toString()
                                    .replaceAll(new RegExp(r'[()]'), "");
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.sexualAbuseController,
                          decoration: InputDecoration(
                              labelText: 'Sexual Abuse',
                              hintText: 'Sexual Abuse',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.sexualAbuseList,
                              widget.abuseForm.sexualAbuse
                                  .map((e) =>
                                      e.toSexualAbuseClassificationString())
                                  .toList(),
                              "Sexual Abuse", (abuse) {
                            widget.abuseForm.sexualAbuse
                                .toggleElement(sexualAbuseFromString(abuse));
                            widget.sexualAbuseController.text =
                                widget.abuseForm.sexualAbuse
                                    .map((attention) {
                                      return attention
                                          .toSexualAbuseClassificationString();
                                    })
                                    .toString()
                                    .replaceAll(new RegExp(r'[()]'), "");
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.forcedMarriageController,
                          decoration: InputDecoration(
                              labelText: 'Forced Marriage',
                              hintText: 'Forced Marriage',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              true,
                              widget.booleanYesNo,
                              [
                                parseBooleanToYesNo(
                                    widget.abuseForm.forcedMarriage)
                              ],
                              "Forced Marriage", (yesNo) {
                            widget.abuseForm.forcedMarriage =
                                parseYesNoToBoolean(yesNo);
                            widget.forcedMarriageController.text = yesNo;
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.rightsDeniedController,
                          decoration: InputDecoration(
                              labelText: 'Rights Denied',
                              hintText: 'Rights Denied',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              false,
                              widget.rightsDeniedList,
                              widget.abuseForm.rightsDenied
                                  .map((e) => e.toRightsString())
                                  .toList(),
                              "Rights Denied", (right) {
                            widget.abuseForm.rightsDenied
                                .toggleElement(rightsFromString(right));
                            widget.rightsDeniedController.text =
                                widget.abuseForm.rightsDenied
                                    .map((attention) {
                                      return attention.toRightsString();
                                    })
                                    .toString()
                                    .replaceAll(new RegExp(r'[()]'), "");
                          }),
                        )),
                    Visibility(
                        visible: widget.abuseForm.rightsDenied
                            .contains(RightsEnum.other),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                                labelText: 'Other Rights Denied',
                                hintText: 'Other Rights Denied',
                                border: OutlineInputBorder()),
                            // style: TextStyle(fontSize: 18, color: Colors.black87),
                            onChanged: (value) {
                              widget.abuseForm.rightsDeniedOther = value;
                            },
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.perpGenderController,
                          decoration: InputDecoration(
                              labelText: 'Perpetrator Gender',
                              hintText: 'Perpetrator Gender',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              true,
                              widget.genderList,
                              nonNullList([
                                widget.abuseForm.perpetrator.gender
                                    .toGenderString()
                              ]),
                              "Perpetrator Gender", (gender) {
                            widget.abuseForm.perpetrator.gender =
                                genderFromString(gender);
                            widget.perpGenderController.text = gender;
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.perpKnownController,
                          decoration: InputDecoration(
                              labelText: 'Perpetrator is Known',
                              hintText: 'Perpetrator is Known',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              true,
                              widget.booleanYesNo,
                              nonNullList([
                                parseBooleanToYesNo(
                                    widget.abuseForm.perpetrator.isKnown)
                              ]),
                              "Perpetrator is known", (yesNo) {
                            widget.abuseForm.perpetrator.isKnown =
                                parseYesNoToBoolean(yesNo);
                            widget.perpKnownController.text = yesNo;
                          }),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          readOnly: true,
                          controller: widget.perpRelationshipController,
                          decoration: InputDecoration(
                              labelText: 'Perpetrator Relationship',
                              hintText: 'Perpetrator Relationship',
                              border: OutlineInputBorder()),
                          onTap: () => widget._showSelectDialog(
                              context,
                              true,
                              widget.relationshipList,
                              [
                                widget
                                    .abuseForm.perpetrator.relationshipToVictim
                                    .toRelationshipString()
                              ],
                              "Perpetrator Relationship", (relationship) {
                            widget.abuseForm.perpetrator.relationshipToVictim =
                                relationshipFromString(relationship);
                            widget.perpRelationshipController.text =
                                relationship;
                          }),
                        )),
                    TextButton(
                      onPressed: () {
                        // Provider.of<FormsOperation>(context, listen: false)
                        //     .addNewForm(widget.abuseForm);
                        if (widget.abuseForm.isReadyToSend()) {
                          FormHttpOperations.sendToBackend(widget.abuseForm);
                          widget.abuseForm = AbuseForm();
                          widget.incidentDateController.text = "";
                          widget.attentionDateController.text = "";
                          widget.victimGenderTextController.text = "";
                          widget.victimAgeTextController.text = "";
                          widget.municipalityController.text = "";
                          widget.communityController.text = "";
                          widget.seekedAttentionController.text = "";
                          widget.offeredAttentionController.text = "";
                          widget.referredAttentionController.text = "";
                          widget.physicalAbuseController.text = "";
                          widget.psychologicalAbuseController.text = "";
                          widget.sexualAbuseController.text = "";
                          widget.forcedMarriageController.text = "";
                          widget.rightsDeniedController.text = "";
                          widget.perpGenderController.text = "";
                          widget.perpKnownController.text = "";
                          widget.perpRelationshipController.text = "";
                          setState(() {});
                        } else {
                          print("Form Incomplete!!");
                        }
                      },
                      child: Text('Submit Form',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Color(0xFF568889).withOpacity(0.5);
                            return Color(0xFF568889);
                          },
                        ),
                      ),
                    ),
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
        padding: EdgeInsets.all(8),
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
  List<String> selectList = [];
  List<String> selectedChoices = [];
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
    List<Widget> choices = [];
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
