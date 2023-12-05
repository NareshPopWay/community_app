
class RequestModel {
  int requestId;
  int memberId;
  int samajId;
  int requestType;
  String aboutRequest;
  String mobileNumber;
  String fileData;
  // DateTime createdOn;
  // int createdBy;
  // int createdUserTypeId;
  // dynamic modifiedOn;
  // dynamic modifiedBy;
  // dynamic modifiedUserTypeId;
  // dynamic isDelete;
  // dynamic deletedOn;
  // dynamic deletedBy;
  // dynamic deletedUserTypeId;

  RequestModel({
    required this.requestId,
    required this.memberId,
    required this.samajId,
    required this.requestType,
    required this.aboutRequest,
    required this.mobileNumber,
    required this.fileData,
    //  required this.createdOn,
    //  required this.createdBy,
    //  required this.createdUserTypeId,
    //  required this.modifiedOn,
    //  required this.modifiedBy,
    //  required this.modifiedUserTypeId,
    //  required this.isDelete,
    //  required this.deletedOn,
    //  required this.deletedBy,
    //  required this.deletedUserTypeId,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
    requestId: json["requestId"]??0,
    memberId: json["memberId"]??0,
    samajId: json["samajId"]??0,
    requestType: json["requestType"]??0,
    aboutRequest: json["aboutRequest"]??'',
    mobileNumber: json["mobileNumber"]??'',
    fileData: json["fileData"]??'',
    // createdOn: DateTime.parse(json["createdOn"]),
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
    "requestId": requestId,
    "memberId": memberId,
    "samajId": samajId,
    "requestType": requestType,
    "aboutRequest": aboutRequest,
    "mobileNumber": mobileNumber,
    "fileData": fileData,
    // "createdOn": createdOn.toIso8601String(),
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
