
class DonationModel {
  int donationId;
  dynamic memberId;
  int samajId;
  int donationType;
  String aboutDonation;
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

  DonationModel({
    required this.donationId,
    this.memberId,
    required this.samajId,
    required this.donationType,
    required this.aboutDonation,
    required this.mobileNumber,
    required this.fileData,
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
  });

  factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
    donationId: json["donationId"]??0,
    memberId: json["memberId"]??0,
    samajId: json["samajId"]??0,
    donationType: json["donationType"],
    aboutDonation: json["aboutDonation"]??'',
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
    "donationId": donationId,
    "memberId": memberId,
    "samajId": samajId,
    "donationType": donationType,
    "aboutDonation": aboutDonation,
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
