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

const Map PhysicalAbuseClassificationStr = {
  PhysicalAbuseClassificationEnum.weaponUsage: "Weapon Usage",
  PhysicalAbuseClassificationEnum.otherPainfulAttack: "Other Painful Attack"
};
Map physicalAbuseClassificationMp = {
  PhysicalAbuseClassificationStr[PhysicalAbuseClassificationEnum.weaponUsage]:
      PhysicalAbuseClassificationEnum.weaponUsage,
  PhysicalAbuseClassificationStr[PhysicalAbuseClassificationEnum
      .otherPainfulAttack]: PhysicalAbuseClassificationEnum.otherPainfulAttack
};

extension ParseToPhysicalAbuseClassificationString
    on PhysicalAbuseClassificationEnum {
  String toPhysicalAbuseClassificationString() {
    return PhysicalAbuseClassificationStr[this] ?? toSimpleCapitalEnum(this);
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

const Map PsychologicalAbuseClassificationStr = {
  PsychologicalAbuseClassificationEnum.violenceThreats: "Violence Threats",
  PsychologicalAbuseClassificationEnum.murderThreats: "Murder Threats",
  PsychologicalAbuseClassificationEnum.verbalHarrassment: "Verbal Harrassment",
  PsychologicalAbuseClassificationEnum.unwantedAttention: "Unwanted Attention",
  PsychologicalAbuseClassificationEnum.nonVerbalThreats: "Non-Verbal Threats",
  PsychologicalAbuseClassificationEnum.propertyDestruction:
      "Property Destruction",
  PsychologicalAbuseClassificationEnum.childThreats: "Child Threats"
};

Map psychologicalAbuseClassificationMp = {
  PsychologicalAbuseClassificationStr[PsychologicalAbuseClassificationEnum
      .violenceThreats]: PsychologicalAbuseClassificationEnum.violenceThreats,
  PsychologicalAbuseClassificationStr[PsychologicalAbuseClassificationEnum
      .murderThreats]: PsychologicalAbuseClassificationEnum.murderThreats,
  PsychologicalAbuseClassificationStr[
          PsychologicalAbuseClassificationEnum.verbalHarrassment]:
      PsychologicalAbuseClassificationEnum.verbalHarrassment,
  PsychologicalAbuseClassificationStr[
          PsychologicalAbuseClassificationEnum.unwantedAttention]:
      PsychologicalAbuseClassificationEnum.unwantedAttention,
  PsychologicalAbuseClassificationStr[PsychologicalAbuseClassificationEnum
      .nonVerbalThreats]: PsychologicalAbuseClassificationEnum.nonVerbalThreats,
  PsychologicalAbuseClassificationStr[
          PsychologicalAbuseClassificationEnum.propertyDestruction]:
      PsychologicalAbuseClassificationEnum.propertyDestruction,
  PsychologicalAbuseClassificationStr[PsychologicalAbuseClassificationEnum
      .childThreats]: PsychologicalAbuseClassificationEnum.childThreats
};

extension ParseToPsychologicalAbuseClassificationString
    on PsychologicalAbuseClassificationEnum {
  String toPsychologicalAbuseClassificationString() {
    return PsychologicalAbuseClassificationStr[this] ??
        toSimpleCapitalEnum(this);
  }
}

enum SexualAbuseClassificationEnum {
  genitalTouching,
  genitalMutilation,
  attemptedRape,
  rape
}
const Map SexualAbuseClassificationStr = {
  SexualAbuseClassificationEnum.genitalTouching: "Genital Touching",
  SexualAbuseClassificationEnum.genitalMutilation: "Genital Mutilation",
  SexualAbuseClassificationEnum.attemptedRape: "Attempted Rape"
};
Map sexualAbuseClassificationMp = {
  SexualAbuseClassificationStr[SexualAbuseClassificationEnum.genitalTouching]:
      SexualAbuseClassificationEnum.genitalTouching,
  SexualAbuseClassificationStr[SexualAbuseClassificationEnum.genitalMutilation]:
      SexualAbuseClassificationEnum.genitalMutilation,
  SexualAbuseClassificationStr[SexualAbuseClassificationEnum.attemptedRape]:
      SexualAbuseClassificationEnum.attemptedRape
};

extension ParseToSexualAbuseClassificationString
    on SexualAbuseClassificationEnum {
  String toSexualAbuseClassificationString() {
    return SexualAbuseClassificationStr[this] ?? toSimpleCapitalEnum(this);
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
const Map RightsStr = {
  RightsEnum.economicResources: "Economic Resources",
  RightsEnum.resourceConflict: "Resource Conflict"
};
Map rightsMp = {
  RightsStr[RightsEnum.economicResources]: RightsEnum.economicResources,
  RightsStr[RightsEnum.resourceConflict]: RightsEnum.resourceConflict
};

extension ParseToRightsString on RightsEnum {
  String toRightsString() {
    return RightsStr[this] ?? toSimpleCapitalEnum(this);
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
const Map RelationshipStr = {
  RelationshipEnum.currentPartner: "Current Partner",
  RelationshipEnum.formerPartner: "Former Partner"
};
Map relationshipMp = {
  RelationshipStr[RelationshipEnum.currentPartner]:
      RelationshipEnum.currentPartner,
  RelationshipStr[RelationshipEnum.formerPartner]:
      RelationshipEnum.formerPartner
};

extension ParseToRelationshipString on RelationshipEnum {
  String toRelationshipString() {
    return RelationshipStr[this] ?? toSimpleCapitalEnum(this);
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

  bool genderValid() {
    return this.gender != null;
  }

  bool isKnownValid() {
    return this.isKnown != null;
  }

  bool isRelationshipValid() {
    return this.relationshipToVictim != null;
  }

  bool isReadyToSend() {
    return genderValid() && isKnownValid() && isRelationshipValid();
  }

  Map toJson() => {
        'gender': gender?.toJSONString() ?? "",
        'isKnown': isKnown ?? "",
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
  List<SeekedAttentionEnum> seekedAttention = [];
  String seekedAttentionOther = "";
  List<OfferedAttentionEnum> offeredAttention = [];
  String offeredAttentionOther = "";
  List<ReferredAttentionEnum> referredAttention = [];
  String referredAttentionOther = "";
  List<PhysicalAbuseClassificationEnum> physicalAbuse = [];
  List<PsychologicalAbuseClassificationEnum> psychologicalAbuse = [];
  List<SexualAbuseClassificationEnum> sexualAbuse = [];
  bool forcedMarriage;
  List<RightsEnum> rightsDenied = [];
  String rightsDeniedOther = "";
  Perpetrator perpetrator = Perpetrator();

  AbuseForm();

  bool incidentDateValid() {
    return this.incidentDate != null;
  }

  bool attentionDateValid() {
    return this.attentionDate != null;
  }

  bool genderValid(){
    return this.gender != null;
  }

  bool ageRangeValid() {
    return this.ageRange != null;
  }

  bool municipalityValid() {
    return this.municipality != null && this.municipality.length > 0;
  }

  bool communityValid() {
    return this.community != null && this.community.length > 0;
  }

  bool isReadyToSend() {
    return incidentDateValid() &&
        attentionDateValid() &&
        genderValid() &&
        ageRangeValid() &&
        municipalityValid() &&
        communityValid() &&
        this.perpetrator.isReadyToSend();
  }

  Map toJson() => {
        'incidentDate': incidentDate?.toIso8601String() ?? "",
        'attentionDate': attentionDate?.toIso8601String() ?? "",
        'gender': gender?.toJSONString() ?? "",
        'ageRange': ageRange?.toNumberString() ?? "",
        'municipality': municipality ?? "",
        'community': community ?? "",
        'seekedAttention': addOtherIfAvailable(
                seekedAttention?.toJSONPairString(), seekedAttentionOther) ??
            "",
        'offeredAttention': addOtherIfAvailable(
                offeredAttention?.toJSONPairString(), offeredAttentionOther) ??
            "",
        'referredAttention': addOtherIfAvailable(
                referredAttention?.toJSONPairString(),
                referredAttentionOther) ??
            "",
        'classification': {
          'physical': physicalAbuse?.toJSONPairString() ?? "",
          'psychological': psychologicalAbuse?.toJSONPairString() ?? "",
          'sexual': sexualAbuse?.toJSONPairString() ?? "",
          if (forcedMarriage != null) 'forcedMarriage': forcedMarriage ?? ""
        },
        'rightDenied': addOtherIfAvailable(
                rightsDenied?.toJSONPairString(), rightsDeniedOther) ??
            "",
        'perpetrator': perpetrator.toJson()
      };
}

Map addOtherIfAvailable(Map theMap, String otherStr) {
  if (otherStr != "") theMap['otherDetails'] = otherStr;
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

extension JSONPairObjectString on List {
  Map toJSONPairString() {
    return {for (var v in this) describeEnum(v): true};
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
  return physicalAbuseClassificationMp[str] ??
      PhysicalAbuseClassificationEnum.values.firstWhere(
          (e) => describeEnum(e).toLowerCase() == str.toLowerCase());
}

PsychologicalAbuseClassificationEnum psychologicalAbuseFromString(String str) {
  return psychologicalAbuseClassificationMp[str] ??
      PsychologicalAbuseClassificationEnum.values.firstWhere(
          (e) => describeEnum(e).toLowerCase() == str.toLowerCase());
}

SexualAbuseClassificationEnum sexualAbuseFromString(String str) {
  return sexualAbuseClassificationMp[str] ??
      SexualAbuseClassificationEnum.values.firstWhere(
          (e) => describeEnum(e).toLowerCase() == str.toLowerCase());
}

RightsEnum rightsFromString(String str) {
  return rightsMp[str] ??
      RightsEnum.values.firstWhere(
          (e) => describeEnum(e).toLowerCase() == str.toLowerCase());
}

RelationshipEnum relationshipFromString(String str) {
  return relationshipMp[str] ??
      RelationshipEnum.values.firstWhere(
          (e) => describeEnum(e).toLowerCase() == str.toLowerCase());
}
