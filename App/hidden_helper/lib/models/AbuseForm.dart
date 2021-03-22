import 'dart:convert';

import 'package:flutter/foundation.dart';

//This should probably be 'sex'
enum GenderEnum { male, female }

extension GenderOps on GenderEnum {
  String toGenderString() {
    return toSimpleCapitalEnum(this);
  }

  String toJSONString() {
    return describeEnum(this);
  }
}

enum AgeRangeEnum {
  underTwelve,
  twelveToSeventeen,
  eighteenToTwentyfour,
  twentyfiveToThirtyfour,
  thirtyfiveToFourtyfour,
  fourtyfiveToFiftyfour,
  fiftyfiveToSixtyfour,
  sixtyfiveToSeventyfour,
  overSeventyfive
}

extension ParseToAgeString on AgeRangeEnum {
  String toNumberString() {
    if (this == null) return null;
    switch (this) {
      case AgeRangeEnum.underTwelve:
        return "<12";
      case AgeRangeEnum.twelveToSeventeen:
        return "12-17";
      case AgeRangeEnum.eighteenToTwentyfour:
        return "18-24";
      case AgeRangeEnum.twentyfiveToThirtyfour:
        return "25-34";
      case AgeRangeEnum.thirtyfiveToFourtyfour:
        return "35-44";
      case AgeRangeEnum.fourtyfiveToFiftyfour:
        return "45-54";
      case AgeRangeEnum.fiftyfiveToSixtyfour:
        return "55-64";
      case AgeRangeEnum.sixtyfiveToSeventyfour:
        return "65-74";
      case AgeRangeEnum.overSeventyfive:
        return "75+";
      default:
        throw Exception("Could not parse age enum to string!");
    }
  }
}

AgeRangeEnum parseAgeFromString(enumStr) {
  switch (enumStr) {
    case "<12":
      return AgeRangeEnum.underTwelve;
    case "12-17":
      return AgeRangeEnum.twelveToSeventeen;
    case "18-24":
      return AgeRangeEnum.eighteenToTwentyfour;
    case "25-34":
      return AgeRangeEnum.twentyfiveToThirtyfour;
    case "35-44":
      return AgeRangeEnum.thirtyfiveToFourtyfour;
    case "45-54":
      return AgeRangeEnum.fourtyfiveToFiftyfour;
    case "55-64":
      return AgeRangeEnum.fiftyfiveToSixtyfour;
    case "65-74":
      return AgeRangeEnum.sixtyfiveToSeventyfour;
    case "75+":
      return AgeRangeEnum.overSeventyfive;
    default:
      throw Exception("Could not parse string to age enum!");
  }
}

enum SeekedAttentionEnum {
  information,
  legal,
  psychosocial,
  medical,
  refuge,
  other
}

extension ParseToSeekedAttentionString on SeekedAttentionEnum {
  String toSeekedAttentionString() {
    return toSimpleCapitalEnum(this);
  }
}

enum OfferedAttentionEnum {
  information,
  legal,
  psychosocial,
  medical,
  refuge,
  other
}

extension ParseToOfferedAttentionString on OfferedAttentionEnum {
  String toOfferedAttentionString() {
    return toSimpleCapitalEnum(this);
  }
}

enum ReferredAttentionEnum { legal, psychosocial, medical, other }

extension ParseToReferredAttentionString on ReferredAttentionEnum {
  String toReferredAttentionString() {
    return toSimpleCapitalEnum(this);
  }
}

enum PhysicalAbuseClassificationEnum {
  hitting,
  pushing,
  choking,
  cutting,
  burning,
  weaponUsage,
  acid,
  otherPainfulAttack
}

extension ParseToPhysicalAbuseClassificationString
    on PhysicalAbuseClassificationEnum {
  String toPhysicalAbuseClassificationString() {
    return toSimpleCapitalEnum(this);
  }
}

enum PsychologicalAbuseClassificationEnum {
  violenceThreats,
  murderThreats,
  intimidation,
  humiliation,
  isolation,
  stalking,
  verbalHarrassment,
  unwantedAttention,
  nonVerbalThreats,
  propertyDestruction,
  custody,
  childThreats
}

extension ParseToPsychologicalAbuseClassificationString
    on PsychologicalAbuseClassificationEnum {
  String toPsychologicalAbuseClassificationString() {
    return toSimpleCapitalEnum(this);
  }
}

enum SexualAbuseClassificationEnum {
  genitalTouching,
  genitalMutilation,
  attemptedRape,
  rape
}

extension ParseToSexualAbuseClassificationString
    on SexualAbuseClassificationEnum {
  String toSexualAbuseClassificationString() {
    return toSimpleCapitalEnum(this);
  }
}

enum RightsEnum {
  economicResources,
  opportunities,
  education,
  healthcare,
  resourceConflict,
  other
}

extension ParseToRightsString on RightsEnum {
  String toRightsString() {
    return toSimpleCapitalEnum(this);
  }
}

enum RelationshipEnum {
  currentPartner,
  formerPartner,
  relative,
  neighbour,
  friend,
  association,
  other
}

extension ParseToRelationshipString on RelationshipEnum {
  String toRelationshipString() {
    return toSimpleCapitalEnum(this);
  }

  String toJSONString() {
    switch (this) {
      case RelationshipEnum.currentPartner:
        return 'current partner';
      case RelationshipEnum.formerPartner:
        return 'former partner';
      case RelationshipEnum.relative:
        return 'relative';
      case RelationshipEnum.neighbour:
        return 'neighbour';
      case RelationshipEnum.friend:
        return 'friend';
      case RelationshipEnum.association:
        return 'association';
      case RelationshipEnum.other:
        return 'other';
      default:
        return 'Error converting relationship to json string';
    }
  }
}

class Perpetrator {
  GenderEnum gender;
  bool isKnown;
  RelationshipEnum relationshipToVictim;

  Perpetrator();

  Map toJson() => {
        'gender': gender?.toJSONString() ?? "",
        'isKnown': isKnown,
        'relationship': relationshipToVictim?.toJSONString() ?? ""
      };
}

class AbuseForm {
  DateTime incidentDate;
  DateTime attentionDate;
  GenderEnum gender;
  AgeRangeEnum ageRange;
  String municipality;
  String community;
  List<SeekedAttentionEnum> seekedAttention = List<SeekedAttentionEnum>();
  String seekedAttentionOther = "";
  List<OfferedAttentionEnum> offeredAttention = List<OfferedAttentionEnum>();
  String offeredAttentionOther = "";
  List<ReferredAttentionEnum> referredAttention = List<ReferredAttentionEnum>();
  String referredAttentionOther = "";
  List<PhysicalAbuseClassificationEnum> physicalAbuse =
      List<PhysicalAbuseClassificationEnum>();
  List<PsychologicalAbuseClassificationEnum> psychologicalAbuse =
      List<PsychologicalAbuseClassificationEnum>();
  List<SexualAbuseClassificationEnum> sexualAbuse =
      List<SexualAbuseClassificationEnum>();
  bool forcedMarriage;
  List<RightsEnum> rightsDenied = List<RightsEnum>();
  String rightsDeniedOther = "";
  Perpetrator perpetrator = Perpetrator();

  AbuseForm();

  Map toJson() => {
        'incidentDate': incidentDate?.toIso8601String() ?? "",
        'attentionDate': attentionDate?.toIso8601String() ?? "",
        'gender': gender?.toJSONString() ?? "",
        'ageRange': ageRange?.toNumberString() ?? "",
        'municipality': municipality ?? "",
        'community': community ?? "",
        'seekedAttention': addOtherIfAvailable(seekedAttention?.toJSONPairString(), seekedAttentionOther) ?? "",
        'offeredAttention': addOtherIfAvailable(offeredAttention?.toJSONPairString(), offeredAttentionOther) ?? "",
        'referredAttention': addOtherIfAvailable(referredAttention?.toJSONPairString(), referredAttentionOther) ?? "",
        'classification': {
          'physical': physicalAbuse?.toJSONPairString() ?? "",
          'psychological': psychologicalAbuse?.toJSONPairString() ?? "",
          'sexual': sexualAbuse?.toJSONPairString() ?? "",
          'forcedMarriage': forcedMarriage ?? ""
        },
        'rightDenied': addOtherIfAvailable(rightsDenied?.toJSONPairString(), rightsDeniedOther) ?? "",
        'perpetrator': perpetrator?.toJson() ?? ""
      };
}

Map addOtherIfAvailable(Map theMap, String otherStr){
  if(otherStr != "")
    theMap['otherDetails'] = otherStr;
  return theMap;
}

extension StringExtension on String {
  String capitaliseFirst() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension ToggleExtension on List {
  void toggleElement(elem) {
    this.contains(elem) ? this.remove(elem) : this.add(elem);
  }
}
extension JSONPairObjectString on List{
  Map toJSONPairString() {
    return { for (var v in this) v: true };
  }
}

String toSimpleCapitalEnum(enumVal) {
  if (enumVal == null) return null;
  return describeEnum(enumVal).split('.').last.capitaliseFirst();
}

String parseBooleanToYesNo(bool inputBool) {
  if (inputBool == null) return null;
  return inputBool ? "Yes" : "No";
}

bool parseYesNoToBoolean(String yesNo) {
  return yesNo == "Yes" ? true : false;
}

List<String> nonNullList(List<String> theList) {
  return theList.where((e) => e != null).toList();
}

// The following should be generalised.
// This was left in anticipation of future updates having separate strings for enums
GenderEnum genderFromString(String str) {
  String lwrStr = str.toLowerCase();
  return GenderEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

SeekedAttentionEnum seekedAttentionFromString(String str) {
  String lwrStr = str.toLowerCase();
  return SeekedAttentionEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

OfferedAttentionEnum offeredAttentionFromString(String str) {
  String lwrStr = str.toLowerCase();
  return OfferedAttentionEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

ReferredAttentionEnum referredAttentionFromString(String str) {
  String lwrStr = str.toLowerCase();
  return ReferredAttentionEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

PhysicalAbuseClassificationEnum physicalAbuseFromString(String str) {
  String lwrStr = str.toLowerCase();
  return PhysicalAbuseClassificationEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

PsychologicalAbuseClassificationEnum psychologicalAbuseFromString(String str) {
  String lwrStr = str.toLowerCase();
  return PsychologicalAbuseClassificationEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

SexualAbuseClassificationEnum sexualAbuseFromString(String str) {
  String lwrStr = str.toLowerCase();
  return SexualAbuseClassificationEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

RightsEnum rightsFromString(String str) {
  String lwrStr = str.toLowerCase();
  return RightsEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

RelationshipEnum relationshipFromString(String str) {
  String lwrStr = str.toLowerCase();
  return RelationshipEnum.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}
