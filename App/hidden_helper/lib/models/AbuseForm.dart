//This should probably be 'sex'
import 'package:flutter/foundation.dart';

enum GenderEnum { male, female }

extension GenderOps on GenderEnum {
  String toGenderString() {
    return toSimpleCapitalEnum(this);
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
}

class AbuseForm {
  DateTime incidentDate;
  DateTime attentionDate;
  GenderEnum gender;
  AgeRangeEnum ageRange;
  String municipality;
  String community;
  List<SeekedAttentionEnum> seekedAttention;
  List<OfferedAttentionEnum> offeredAttention;
  List<ReferredAttentionEnum> referredAttention;
  List<PhysicalAbuseClassificationEnum> physicalAbuse;
  List<PsychologicalAbuseClassificationEnum> psychologicalAbuse;
  List<SexualAbuseClassificationEnum> sexualAbuse;
  bool forcedMarriage;
  List<RightsEnum> rightsDenied;

  AbuseForm();
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

dynamic enumFromString(String enumStr, enumClass) {
  String lwrStr = enumStr.toLowerCase();
  return enumClass.values
      .firstWhere((e) => describeEnum(e).toLowerCase() == lwrStr);
}

String toSimpleCapitalEnum(enumVal) {
  return describeEnum(enumVal).split('.').last.capitaliseFirst();
}
