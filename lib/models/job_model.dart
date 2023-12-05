// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

import 'dart:convert';

List<JobModel> jobModelFromJson(String str) => List<JobModel>.from(json.decode(str).map((x) => JobModel.fromJson(x)));

String jobModelToJson(List<JobModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobModel {
  int jobId;
  int memberId;
  String memberName;
  int samajId;
  String mobileNumber;
  String whatsappNumber;
  String companyName;
  String address;
  String website;
  String email;
  String jobFor;
  String jobLocation;
  String jobDetails;
  String visitingCard;
  String salary;
  dynamic requiredEducation;
  dynamic isApprove;
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
  // String samajName;

   JobModel({
    required this.jobId,
    required this.memberId,
    required this.memberName,
    required this.samajId,
    required this.mobileNumber,
    required this.whatsappNumber,
    required this.companyName,
    required this.address,
    required this.website,
    required this.email,
    required this.jobFor,
    required this.jobLocation,
    required this.jobDetails,
    required this.visitingCard,
    required this.salary,
    required this.requiredEducation,
    required this.isApprove,
    // required this.createdOn,
    // required this.createdBy,
    // required this.createdUserTypeId,
    // required this.modifiedOn,
    // required this.modifiedBy,
    // required this.modifiedUserTypeId,
    // required this.isDelete,
    // required this.deletedOn,
    // required this.deletedBy,
    // required this.deletedUserTypeId,
    // required this.samajName,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    jobId: json["jobId"],
    memberId: json["memberId"],
    memberName: json["memberName"],
    samajId: json["samajId"],
    mobileNumber: json["mobileNumber"],
    whatsappNumber: json["whatsappNumber"],
    companyName: json["companyName"],
    address: json["address"],
    website: json["website"],
    email: json["email"],
    jobFor: json["jobFor"],
    jobLocation: json["jobLocation"],
    jobDetails: json["jobDetails"],
    visitingCard: json["visitingCard"],
    salary: json["salary"],
    requiredEducation: json["requiredEducation"],
    isApprove: json["isApprove"],
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
    // samajName: json["samajName"],
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "memberId": memberId,
    "memberName": memberName,
    "samajId": samajId,
    "mobileNumber": mobileNumber,
    "whatsappNumber": whatsappNumber,
    "companyName": companyName,
    "address": address,
    "website": website,
    "email": email,
    "jobFor": jobFor,
    "jobLocation": jobLocation,
    "jobDetails": jobDetails,
    "visitingCard": visitingCard,
    "salary": salary,
    "requiredEducation": requiredEducation,
    "isApprove": isApprove,
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
    // "samajName": samajName,
  };
}
