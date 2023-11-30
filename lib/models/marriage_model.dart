
class MarriageModel {

  int marriageId;
  int memberId;
  int samajId;
  String name;
  String gender;
  DateTime birthDate;
  String maritalStatus;
  String mobileNumber;
  String whatsappNumber;
  String qualification;
  String occupation;
  String monthlyIncome;
  String sakhe;
  String hobby;
  String remark;
  String village;
  String mosal;
  String hight;
  String weight;
  String fileData;
  String fatherName;
  String fatherMobileNumber;
  String fatherOccupation;
  String fatherIncome;
  String motherName;
  String motherMobileNumber;
  String motherOccupation;
  String motherIncome;
  String numberOfBrother;
  String numberOfSister;
  String address;
  bool isApprove;
  String samajName;
  // dynamic accessToken;
  // dynamic webFcmKey;
  // dynamic mobFcmKey;
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


  MarriageModel({
    required this.marriageId,
    required this.memberId,
    required this.samajId,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.maritalStatus,
    required this.mobileNumber,
    required this.whatsappNumber,
    required this.qualification,
    required this.occupation,
    required this.monthlyIncome,
    required this.sakhe,
    required this.hobby,
    required this.remark,
    required this.village,
    required this.mosal,
    required this.hight,
    required this.weight,
    required this.fileData,
    required this.fatherName,
    required this.fatherMobileNumber,
    required this.fatherOccupation,
    required this.fatherIncome,
    required this.motherName,
    required this.motherMobileNumber,
    required this.motherOccupation,
    required this.motherIncome,
    required this.numberOfBrother,
    required this.numberOfSister,
    required this.address,
    required this.isApprove,
    required this.samajName,
    // this.accessToken,
    // this.webFcmKey,
    // this.mobFcmKey,
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
    this.marriageId = this.marriageId == null ? 0 :this.marriageId;
    this.memberId = this.memberId == null ? 0 :this.memberId;
    this.samajName = this.samajName == null ? "" :this.samajName;
    this.samajId = this.samajId == null ? 0 :this.samajId;
    this.motherIncome = this.motherIncome == null ? "" :this.motherIncome;
    this.motherMobileNumber = this.motherMobileNumber == null ? "" :this.motherMobileNumber;
  }

  factory MarriageModel.fromJson(Map<String, dynamic> json) => MarriageModel(
    marriageId: json["marriageId"]??0,
    memberId: json["memberId"]??0,
    samajId: json["samajId"]??0,
    name: json["name"]??'',
    gender: json["gender"]??'',
    birthDate: DateTime.parse(json["birthDate"]),
    maritalStatus: json["maritalStatus"]??'',
    mobileNumber: json["mobileNumber"]??'',
    whatsappNumber: json["whatsappNumber"]??'',
    qualification: json["qualification"]??'',
    occupation: json["occupation"]??'',
    monthlyIncome: json["monthlyIncome"]??'',
    sakhe: json["sakhe"]??'',
    hobby: json["hobby"]??'',
    remark: json["remark"]??'',
    village: json["village"]??'',
    mosal: json["mosal"]??'',
    hight: json["hight"]??'',
    weight: json["weight"]??'',
    fileData: json["fileData"]??'',
    fatherName: json["fatherName"]??'',
    fatherMobileNumber: json["fatherMobileNumber"]??'',
    fatherOccupation: json["fatherOccupation"]??'',
    fatherIncome: json["fatherIncome"]??'',
    motherName: json["motherName"]??'',
    motherMobileNumber: json["motherMobileNumber"]??'',
    motherOccupation: json["motherOccupation"]??'',
    motherIncome: json["motherIncome"]??'',
    numberOfBrother: json["numberOfBrother"]??'',
    numberOfSister: json["numberOfSister"]??'',
    address: json["address"]??'',
    isApprove: json["isApprove"]??false,
    samajName: json["samajName"]??'',
    // accessToken: json["accessToken"],
    // webFcmKey: json["webFcmKey"],
    // mobFcmKey: json["mobFcmKey"],
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
    "marriageId": marriageId,
    "memberId": memberId,
    "samajId": samajId,
    "name": name,
    "gender": gender,
    "birthDate": birthDate.toIso8601String(),
    "maritalStatus": maritalStatus,
    "mobileNumber": mobileNumber,
    "whatsappNumber": whatsappNumber,
    "qualification": qualification,
    "occupation": occupation,
    "monthlyIncome": monthlyIncome,
    "sakhe": sakhe,
    "hobby": hobby,
    "remark": remark,
    "village": village,
    "mosal": mosal,
    "hight": hight,
    "weight": weight,
    "fileData": fileData,
    "fatherName": fatherName,
    "fatherMobileNumber": fatherMobileNumber,
    "fatherOccupation": fatherOccupation,
    "fatherIncome": fatherIncome,
    "motherName": motherName,
    "motherMobileNumber": motherMobileNumber,
    "motherOccupation": motherOccupation,
    "motherIncome": motherIncome,
    "numberOfBrother": numberOfBrother,
    "numberOfSister": numberOfSister,
    "address": address,
    "isApprove": isApprove,
    "samajName": samajName,
    // "accessToken": accessToken,
    // "webFcmKey": webFcmKey,
    // "mobFcmKey": mobFcmKey,
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
