
class FeedbackModel {
  int feedbackId;
  int memberId;
  int samajId;
  String memberName;
  String village;
  String feedbacks;
  String mobileNumber;
  String samajName;
  // DateTime createdOn;
  // int createdBy;
  // int createdUserTypeId;
  // dynamic modifiedOn;
  // dynamic modifiedBy;
  // dynamic modifiedUserTypeId;
  // dynamic isDelete;
  // dynamic deletedOn;
  // dynamic deletedUserTypeId;
  // dynamic deletedBy;

  FeedbackModel({
    required this.feedbackId,
    required  this.memberId,
    required this.samajId,
    required  this.memberName,
    required  this.village,
    required this.feedbacks,
    required this.mobileNumber,
    required this.samajName,
    // this.createdOn,
    // this.createdBy,
    // this.createdUserTypeId,
    // this.modifiedOn,
    // this.modifiedBy,
    // this.modifiedUserTypeId,
    // this.isDelete,
    // this.deletedOn,
    // this.deletedUserTypeId,
    // this.deletedBy,
  })
  {
    this.feedbackId = this.feedbackId == null ? 0 :this.feedbackId;
    this.memberId = this.memberId == null ? 0 :this.memberId;
    this.samajId = this.samajId == null ? 0 :this.samajId;
    this.samajName = this.samajName == null ? "" :this.samajName;
  }

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    feedbackId: json["feedbackId"],
    memberId: json["memberId"],
    samajId: json["samajId"],
    memberName: json["memberName"],
    village: json["village"],
    feedbacks: json["feedbacks"],
    mobileNumber: json["mobileNumber"],
    samajName: json["samajName"],
    // createdOn: DateTime.parse(json["createdOn"]),
    // createdBy: json["createdBy"],
    // createdUserTypeId: json["createdUserTypeId"],
    // modifiedOn: json["modifiedOn"],
    // modifiedBy: json["modifiedBy"],
    // modifiedUserTypeId: json["modifiedUserTypeId"],
    // isDelete: json["isDelete"],
    // deletedOn: json["deletedOn"],
    // deletedUserTypeId: json["deletedUserTypeId"],
    // deletedBy: json["deletedBy"],
  );

  Map<String, dynamic> toJson() => {
    "feedbackId": feedbackId,
    "memberId": memberId,
    "samajId": samajId,
    "memberName": memberName,
    "village": village,
    "feedbacks": feedbacks,
    "mobileNumber": mobileNumber,
    "samajName": samajName,
    // "createdOn": createdOn.toIso8601String(),
    // "createdBy": createdBy,
    // "createdUserTypeId": createdUserTypeId,
    // "modifiedOn": modifiedOn,
    // "modifiedBy": modifiedBy,
    // "modifiedUserTypeId": modifiedUserTypeId,
    // "isDelete": isDelete,
    // "deletedOn": deletedOn,
    // "deletedUserTypeId": deletedUserTypeId,
    // "deletedBy": deletedBy,
  };
}
