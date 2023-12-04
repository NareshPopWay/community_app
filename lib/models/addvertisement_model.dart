
class AdvertisementModel {
  int? advertisementId;
  int? memberId;
  int? samajId;
  String memberName;
  String aboutAdvertisement;
  String fileData;
  String mobileNumber;
  String whatsappNumber;
  // dynamic isApprove;
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
  // String samajName;

  AdvertisementModel({
    this.advertisementId,
    this.memberId,
    this.samajId,
    required this.memberName,
    required this.aboutAdvertisement,
    required this.fileData,
    required this.mobileNumber,
    required this.whatsappNumber,
    // this.isApprove,
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
    // this.samajName,
  })
  {
    this.advertisementId = this.advertisementId == null ? 0 :this.advertisementId;
    this.memberId = this.memberId == null ? 0 :this.memberId;
    this.samajId = this.samajId == null ? 0 :this.samajId;
  }

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    advertisementId: json["advertisementId"],
    memberId: json["memberId"],
    samajId: json["samajId"],
    memberName: json["memberName"],
    aboutAdvertisement: json["aboutAdvertisement"],
    fileData: json["fileData"],
    mobileNumber: json["mobileNumber"],
    whatsappNumber: json["whatsappNumber"],
    // isApprove: json["isApprove"],
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
    // samajName: json["samajName"],
  );

  Map<String, dynamic> toJson() => {
    "advertisementId": advertisementId,
    "memberId": memberId,
    "samajId": samajId,
    "memberName": memberName,
    "aboutAdvertisement": aboutAdvertisement,
    "fileData": fileData,
    "mobileNumber": mobileNumber,
    "whatsappNumber": whatsappNumber,
    // "isApprove": isApprove,
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
    // "samajName": samajName,
  };
}
