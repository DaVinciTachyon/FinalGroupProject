//This should probably be 'sex'
enum GenderEnum { male, female }

extension ParseToGenderString on GenderEnum {
  String toGenderString() {
    return this.toString().split('.').last.capitaliseFirst();
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
      default:
        return "75+";
    }
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
    return this.toString().split('.').last.capitaliseFirst();
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
    return this.toString().split('.').last.capitaliseFirst();
  }
}

enum ReferredAttentionEnum { legal, psychosocial, medical, other }

extension ParseToReferredAttentionString on ReferredAttentionEnum {
  String toReferredAttentionString() {
    return this.toString().split('.').last.capitaliseFirst();
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
    return this.toString().split('.').last.capitaliseFirst();
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
    return this.toString().split('.').last.capitaliseFirst();
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
    return this.toString().split('.').last.capitaliseFirst();
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
    return this.toString().split('.').last.capitaliseFirst();
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
    return this.toString().split('.').last.capitaliseFirst();
  }
}


//Dart only supports library-level privacy, don't use this
// class Attention {
//   bool legal;
//   bool psychosocial;
//   bool medical;
//   bool other;
//   String otherDetails;

//   Attention(this.legal, this.psychosocial, this.medical, this.other,
//       this.otherDetails);
// }

// class ReferredAttention extends Attention {
//   ReferredAttention(legal, psychosocial, medical, other, otherDetails)
//       : super(legal, psychosocial, medical, other, otherDetails);
// }

// class AttentionSeeked extends Attention {
//   bool refuge;
//   bool information;

//   AttentionSeeked(this.information, legal, psychosocial, medical, this.refuge,
//       other, otherDetails)
//       : super(legal, psychosocial, medical, other, otherDetails);
// }

// class AttentionOffered extends Attention {
//   bool refuge;
//   bool information;

//   AttentionOffered(this.information, legal, psychosocial, medical, this.refuge,
//       other, otherDetails)
//       : super(legal, psychosocial, medical, other, otherDetails);
// }

class Rights {
  bool economicResources;
  bool opportunities;
  bool education;
  bool healthcare;
  bool resourceConflict;
  bool other;
  String otherDetails;

  Rights(this.economicResources, this.opportunities, this.education,
      this.healthcare, this.resourceConflict, this.other, this.otherDetails);
}

class CaseClassification {
  bool physicalHitting,
      physicalPushing,
      physicalChoking,
      physicalCutting,
      physicalBurning,
      physicalWeaponUsage,
      physicalAcid,
      physicalOtherPainfulAttack;
  bool psychologicalViolenceThreats,
      psychologicalMurderThreats,
      psychologicalIntimidation,
      psychologicalHumiliation,
      psychologicalIsolation,
      psychologicalStalking,
      psychologicalVerbalHarrassment,
      psychologicalUnwantedAttention,
      psychologicalNonVerbalThreats;
}

class Perpetrator {
  GenderEnum gender;
  bool isKnown;
  RelationshipEnum relationShip;

  Perpetrator(this.gender, this.isKnown, this.relationShip);
}

class AbuseForm {
  //tmp
  String type;
  String location;

  DateTime incidentDate;
  DateTime attentionDate;
  GenderEnum gender;
  AgeRangeEnum ageRange;
  String municipality;
  String community;
  // AttentionSeeked seekedAttention;
  // AttentionOffered offeredAttention;
  CaseClassification classification; //TODO
  Rights rightDenied;
  Perpetrator perpetrator;

  // AbuseForm(this.incidentDate, this.attentionDate, this.gender, this.ageRange,
  //     this.municipality, this.community, this.seekedAttention,
  //     this.offeredAttention, this.classification, this.rightDenied,
  //     this.perpetrator);

  AbuseForm(this.type, this.location);
}

extension StringExtension on String {
  String capitaliseFirst() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
