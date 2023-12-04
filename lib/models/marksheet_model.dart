
class MarksheetModel {
  int marksheetId;
  int memberId;
  int samajId;
  String marksheetImage;
  String qualification;
  String mediumType;
  String village;
  String studentName;
  String mobileNumber;
  bool isApprove;
  String samajName;
  // dynamic createdOn;
  // dynamic createdBy;
  // dynamic createdUserTypeId;
  // dynamic modifiedOn;
  // dynamic modifiedBy;
  // dynamic modifiedUserTypeId;
  // dynamic isDelete;
  // dynamic deletedOn;
  // dynamic deletedBy;
  // dynamic deletedUserTypeId;


  MarksheetModel({
    required this.marksheetId,
    required this.memberId,
    required this.samajId,
    required  this.marksheetImage,
    required  this.qualification,
    required  this.mediumType,
    required  this.village,
    required this.studentName,
    required  this.mobileNumber,
    required  this.isApprove,
    required this.samajName,
    // this.createdOn,
    // this.createdBy,
    // this.createdUserTypeId,
    // this.modifiedOn,
    // this.modifiedBy,
    // this.modifiedUserTypeId,
    // this.isDelete,
    // this.deletedOn,
    // this.deletedBy,
    // this.deletedUserTypeId,
  })
  {
    this.marksheetId = this.marksheetId == null ? 0 :this.marksheetId;
    this.memberId = this.memberId == null ? 0 :this.memberId;
    this.samajId = this.samajId == null ? 0 :this.samajId;
  }

  factory MarksheetModel.fromJson(Map<String, dynamic> json) => MarksheetModel(
    marksheetId: json["marksheetId"]??0,
    memberId: json["memberId"]??0,
    samajId: json["samajId"]??0,
    marksheetImage: json["marksheetImage"]??'',
    qualification: json["qualification"]??'',
    mediumType: json["mediumType"]??'',
    village: json["village"]??'',
    studentName: json["studentName"]??'',
    mobileNumber: json["mobileNumber"]??'',
    isApprove: json["isApprove"]??false,
    samajName: json["samajName"]??'',
    // createdOn: json["createdOn"],
    // createdBy: json["createdBy"],
    // createdUserTypeId: json["createdUserTypeId"],
    // modifiedOn: json["modifiedOn"],
    // modifiedBy: json["modifiedBy"],
    // modifiedUserTypeId: json["modifiedUserTypeId"],
    // isDelete: json["isDelete"],
    // deletedOn: json["deletedOn"],
    // deletedBy: json["deletedBy"],
    // deletedUserTypeId: json["deletedUserTypeId"],
  );

  Map<String, dynamic> toJson() => {
    "marksheetId": marksheetId,
    "memberId": memberId,
    "samajId": samajId,
    "marksheetImage": marksheetImage,
    "qualification": qualification,
    "mediumType": mediumType,
    "village": village,
    "studentName": studentName,
    "mobileNumber": mobileNumber,
    "isApprove": isApprove,
    "samajName": samajName,
    // "createdOn": createdOn,
    // "createdBy": createdBy,
    // "createdUserTypeId": createdUserTypeId,
    // "modifiedOn": modifiedOn,
    // "modifiedBy": modifiedBy,
    // "modifiedUserTypeId": modifiedUserTypeId,
    // "isDelete": isDelete,
    // "deletedOn": deletedOn,
    // "deletedBy": deletedBy,
    // "deletedUserTypeId": deletedUserTypeId,
  };
}
