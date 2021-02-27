//This should probably be 'sex'
enum GenderEnum { male, female }G

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

enum RelationshipEnum {
  currentPartner,
  formerPartner,
  relative,
  neighbour,
  friend,
  association,
  other
}

//Dart only supports library-level privacy, don't use this
class Attention {
  bool legal;
  bool psychosocial;
  bool medical;
  bool other;
  String otherDetails;

  Attention(this.legal, this.psychosocial, this.medical, this.other, this.otherDetails);
}

class ReferredAttention extends Attention {
  ReferredAttention(legal, psychosocial, medical, other, otherDetails)
      : super(legal, psychosocial, medical, other, otherDetails);
}

class AttentionSeeked extends Attention {
  bool refuge;
  bool information;

  AttentionSeeked(this.information, legal, psychosocial, medical, this.refuge, other, otherDetails)
      : super(legal, psychosocial, medical, other, otherDetails);
}

class AttentionOffered extends Attention {
  bool refuge;
  bool information;

  AttentionOffered(
      this.information, legal, psychosocial, medical, this.refuge, other, otherDetails)
      : super(legal, psychosocial, medical, other, otherDetails);
}

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

class CaseClassification {}

class Perpetrator {
  GenderEnum gender;
  bool isKnown;
  RelationshipEnum relationShip;

  Perpetrator(this.gender, this.isKnown, this.relationShip)
}

class AbuseForm {
  DateTime incidentDate;
  DateTime attentionDate;
  GenderEnum gender;
  AgeRangeEnum ageRange;
  String municipality;
  String community;
  AttentionSeeked seekedAttention;
  AttentionOffered offeredAttention;
  Rights rightDenied;
  CaseClassification classification; //TODO
  Perpetrator perpetrator;



  String type;
  String location;

  AbuseForm(this.type, this.location);
}
