import 'package:flutter/material.dart';
import 'package:hidden_helper/models/AbuseForm.dart';
import 'package:hidden_helper/models/FormsOperation.dart';

class FormScreen extends StatefulWidget {
  final incidentDateController = TextEditingController();
  final attentionDateController = TextEditingController();
  final victimGenderTextController = TextEditingController();
  final victimAgeTextController = TextEditingController();
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

  final abuseForm = AbuseForm();

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
                      controller: widget.incidentDateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Incident Date',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () async {
                        widget.abuseForm.incidentDate = await showDatePicker(
                            context: context,
                            initialDate: widget.abuseForm.incidentDate == null
                                ? DateTime.now()
                                : widget.abuseForm.incidentDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        widget.incidentDateController.text = widget
                            .abuseForm.incidentDate
                            .toString()
                            .split(" ")[0];
                      },
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.attentionDateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Attention Date',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () async {
                        widget.abuseForm.attentionDate = await showDatePicker(
                            context: context,
                            initialDate: widget.abuseForm.attentionDate == null
                                ? DateTime.now()
                                : widget.abuseForm.attentionDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        widget.attentionDateController.text = widget
                            .abuseForm.attentionDate
                            .toString()
                            .split(" ")[0];
                      },
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.victimGenderTextController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Victim Gender',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                    ),
                    TextField(
                        readOnly: true,
                        controller: widget.victimAgeTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Victim Age',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black54)),
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
                            })),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Municipality',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      onChanged: (value) {
                        widget.abuseForm.municipality = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Community',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      onChanged: (value) {
                        widget.abuseForm.community = value;
                      },
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.seekedAttentionController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Seeked Attention',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                        widget.seekedAttentionController.text =
                            widget.abuseForm.seekedAttention.map((attention) {
                          return attention.toSeekedAttentionString();
                        }).toString();
                        setState(() {});
                      }),
                    ),
                    Visibility(
                      visible: widget.abuseForm.seekedAttention
                          .contains(SeekedAttentionEnum.other),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Other Attention Seeked',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black54)),
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                        onChanged: (value) {
                          widget.abuseForm.seekedAttentionOther = value;
                        },
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.offeredAttentionController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Offered Attention',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                        widget.offeredAttentionController.text =
                            widget.abuseForm.offeredAttention.map((attention) {
                          return attention.toOfferedAttentionString();
                        }).toString();
                        setState(() {});
                      }),
                    ),
                    Visibility(
                      visible: widget.abuseForm.offeredAttention
                          .contains(OfferedAttentionEnum.other),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Other Attention Offered',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black54)),
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                        onChanged: (value) {
                          widget.abuseForm.offeredAttentionOther = value;
                        },
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.referredAttentionController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Referred Attention',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                        widget.referredAttentionController.text =
                            widget.abuseForm.referredAttention.map((attention) {
                          return attention.toReferredAttentionString();
                        }).toString();
                        setState(() {});
                      }),
                    ),
                    Visibility(
                      visible: widget.abuseForm.referredAttention
                          .contains(ReferredAttentionEnum.other),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Other Attention Referred',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black54)),
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                        onChanged: (value) {
                          widget.abuseForm.referredAttentionOther = value;
                        },
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.physicalAbuseController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Physical Abuse',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                            widget.abuseForm.physicalAbuse.map((attention) {
                          return attention
                              .toPhysicalAbuseClassificationString();
                        }).toString();
                      }),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.psychologicalAbuseController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Psychological Abuse',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () => widget._showSelectDialog(
                          context,
                          false,
                          widget.psychologicalAbuseList,
                          widget.abuseForm.psychologicalAbuse
                              .map((e) =>
                                  e.toPsychologicalAbuseClassificationString())
                              .toList(),
                          "Psychological Abuse", (abuse) {
                        widget.abuseForm.psychologicalAbuse
                            .toggleElement(psychologicalAbuseFromString(abuse));
                        widget.psychologicalAbuseController.text = widget
                            .abuseForm.psychologicalAbuse
                            .map((attention) {
                          return attention
                              .toPsychologicalAbuseClassificationString();
                        }).toString();
                      }),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.sexualAbuseController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Sexual Abuse',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () => widget._showSelectDialog(
                          context,
                          false,
                          widget.sexualAbuseList,
                          widget.abuseForm.sexualAbuse
                              .map((e) => e.toSexualAbuseClassificationString())
                              .toList(),
                          "Sexual Abuse", (abuse) {
                        widget.abuseForm.sexualAbuse
                            .toggleElement(sexualAbuseFromString(abuse));
                        widget.sexualAbuseController.text =
                            widget.abuseForm.sexualAbuse.map((attention) {
                          return attention.toSexualAbuseClassificationString();
                        }).toString();
                      }),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.forcedMarriageController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Forced Marriage',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () => widget._showSelectDialog(
                          context,
                          true,
                          widget.booleanYesNo,
                          [
                            parseBooleanToYesNo(widget.abuseForm.forcedMarriage)
                          ],
                          "Forced Marriage", (yesNo) {
                        widget.abuseForm.forcedMarriage =
                            parseYesNoToBoolean(yesNo);
                        widget.forcedMarriageController.text = yesNo;
                      }),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.rightsDeniedController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Rights Denied',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                            widget.abuseForm.rightsDenied.map((attention) {
                          return attention.toRightsString();
                        }).toString();
                      }),
                    ),
                    Visibility(
                      visible: widget.abuseForm.rightsDenied
                          .contains(RightsEnum.other),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Other Rights Denied',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black54)),
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                        onChanged: (value) {
                          widget.abuseForm.rightsDeniedOther = value;
                        },
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.perpGenderController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Perpetrator Gender',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () => widget._showSelectDialog(
                          context,
                          true,
                          widget.genderList,
                          nonNullList([
                            widget.abuseForm.perpetrator.gender.toGenderString()
                          ]),
                          "Perpetrator Gender", (gender) {
                        widget.abuseForm.perpetrator.gender =
                            genderFromString(gender);
                        widget.perpGenderController.text = gender;
                      }),
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.perpKnownController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Perpetrator is known',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
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
                    ),
                    TextField(
                      readOnly: true,
                      controller: widget.perpRelationshipController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Perpetrator Relationship',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      onTap: () => widget._showSelectDialog(
                          context,
                          true,
                          widget.relationshipList,
                          [
                            widget.abuseForm.perpetrator.relationshipToVictim
                                .toRelationshipString()
                          ],
                          "Perpetrator Relationship", (relationship) {
                        widget.abuseForm.perpetrator.relationshipToVictim =
                            relationshipFromString(relationship);
                        widget.perpRelationshipController.text = relationship;
                      }),
                    ),
                    TextButton(
                      onPressed: () {
                        // Provider.of<FormsOperation>(context, listen: false)
                        //     .addNewForm(widget.abuseForm);
                        FormHttpOperations.sendToBackend(widget.abuseForm);
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
