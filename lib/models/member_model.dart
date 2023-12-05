// To parse this JSON data, do
//
//     final memberModel = memberModelFromJson(jsonString);

import 'dart:convert';

List<MemberModel> memberModelFromJson(String str) => List<MemberModel>.from(json.decode(str).map((x) => MemberModel.fromJson(x)));

String memberModelToJson(List<MemberModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemberModel {
  int memberId;
  int samajId;
  dynamic memberNumber;
  String memberName;
  String address;
  String area;
  String village;
  String sakhe;
  dynamic gender;
  String mobileNumber;
  dynamic whatsappNumber;
  dynamic birthDate;
  dynamic email;
  dynamic education;
  dynamic maritalStatus;
  dynamic occupation;
  dynamic bloodGroup;
  dynamic fileData;
  String username;
  String password;
  dynamic isAdmin;
  dynamic accessToken;
  dynamic webFcmKey;
  dynamic mobFcmKey;
  DateTime createdOn;
  int createdBy;
  int createdUserTypeId;
  dynamic modifiedOn;
  dynamic modifiedBy;
  dynamic modifiedUserTypeId;
  dynamic isDelete;
  dynamic deletedOn;
  dynamic deletedBy;
  dynamic deletedUserTypeId;
  String samajName;
  dynamic contactPersonName;
  dynamic contactPersonNumber;

  MemberModel({
    required this.memberId,
    required this.samajId,
    required this.memberNumber,
    required this.memberName,
    required this.address,
    required this.area,
    required this.village,
    required this.sakhe,
    required this.gender,
    required this.mobileNumber,
    required this.whatsappNumber,
    required this.birthDate,
    required this.email,
    required this.education,
    required this.maritalStatus,
    required this.occupation,
    required this.bloodGroup,
    required this.fileData,
    required this.username,
    required this.password,
    required this.isAdmin,
    required this.accessToken,
    required this.webFcmKey,
    required this.mobFcmKey,
    required this.createdOn,
    required this.createdBy,
    required this.createdUserTypeId,
    required this.modifiedOn,
    required this.modifiedBy,
    required this.modifiedUserTypeId,
    required this.isDelete,
    required this.deletedOn,
    required this.deletedBy,
    required this.deletedUserTypeId,
    required this.samajName,
    required this.contactPersonName,
    required this.contactPersonNumber,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
    memberId: json["memberId"],
    samajId: json["samajId"],
    memberNumber: json["memberNumber"],
    memberName: json["memberName"],
    address: json["address"],
    area: json["area"],
    village: json["village"],
    sakhe: json["sakhe"],
    gender: json["gender"],
    mobileNumber: json["mobileNumber"],
    whatsappNumber: json["whatsappNumber"],
    birthDate: json["birthDate"],
    email: json["email"],
    education: json["education"],
    maritalStatus: json["maritalStatus"],
    occupation: json["occupation"],
    bloodGroup: json["bloodGroup"],
    fileData: json["fileData"],
    username: json["username"],
    password: json["password"],
    isAdmin: json["isAdmin"],
    accessToken: json["accessToken"],
    webFcmKey: json["webFcmKey"],
    mobFcmKey: json["mobFcmKey"],
    createdOn: DateTime.parse(json["createdOn"]),
    createdBy: json["createdBy"],
    createdUserTypeId: json["createdUserTypeId"],
    modifiedOn: json["modifiedOn"],
    modifiedBy: json["modifiedBy"],
    modifiedUserTypeId: json["modifiedUserTypeId"],
    isDelete: json["isDelete"],
    deletedOn: json["deletedOn"],
    deletedBy: json["deletedBy"],
    deletedUserTypeId: json["deletedUserTypeId"],
    samajName: json["samajName"],
    contactPersonName: json["contactPersonName"],
    contactPersonNumber: json["contactPersonNumber"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "samajId": samajId,
    "memberNumber": memberNumber,
    "memberName": memberName,
    "address": address,
    "area": area,
    "village": village,
    "sakhe": sakhe,
    "gender": gender,
    "mobileNumber": mobileNumber,
    "whatsappNumber": whatsappNumber,
    "birthDate": birthDate,
    "email": email,
    "education": education,
    "maritalStatus": maritalStatus,
    "occupation": occupation,
    "bloodGroup": bloodGroup,
    "fileData": fileData,
    "username": username,
    "password": password,
    "isAdmin": isAdmin,
    "accessToken": accessToken,
    "webFcmKey": webFcmKey,
    "mobFcmKey": mobFcmKey,
    "createdOn": createdOn.toIso8601String(),
    "createdBy": createdBy,
    "createdUserTypeId": createdUserTypeId,
    "modifiedOn": modifiedOn,
    "modifiedBy": modifiedBy,
    "modifiedUserTypeId": modifiedUserTypeId,
    "isDelete": isDelete,
    "deletedOn": deletedOn,
    "deletedBy": deletedBy,
    "deletedUserTypeId": deletedUserTypeId,
    "samajName": samajName,
    "contactPersonName": contactPersonName,
    "contactPersonNumber": contactPersonNumber,
  };
}
