
class BusinessModel {
  int businessId;
  int memberId;
  int samajId;
  String businessType;
  String businessName;
  String memberName;
  String village;
  String mobileNumber;
  String whatsappNumber;
  String visitingCard;
  dynamic isApprove;
  // String businessAddress;
  // String businessDetails;
  // dynamic createdOn;
  // dynamic createdBy;
  // dynamic createdUserTypeId;
  // dynamic modifiedOn;
  // dynamic modifiedBy;
  // dynamic modifiedUserTypeId;
  // dynamic deletedOn;
  // dynamic isDelete;
  // dynamic deletedBy;
  // dynamic deletedUserTypeId;
  // String samajName;

  BusinessModel({
    required this.businessId,
    required this.memberId,
    required this.samajId,
    required this.businessType,
    required this.businessName,
    required this.memberName,
    required this.village,
    required this.mobileNumber,
    required this.whatsappNumber,
    required this.visitingCard,
    required this.isApprove,
    // this.businessDetails,
    // this.businessAddress,
    // this.createdOn,
    // this.createdBy,
    // this.createdUserTypeId,
    // this.modifiedOn,
    // this.modifiedBy,
    // this.modifiedUserTypeId,
    // this.deletedOn,
    // this.isDelete,
    // this.deletedBy,
    // this.deletedUserTypeId,
    // this.samajName,
  })
  {
    this.businessId = this.businessId == null ? 0 :this.businessId;
    this.memberId = this.memberId == null ? 0 :this.memberId;
    this.samajId = this.samajId == null ? 0 :this.samajId;
  }

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
    businessId: json["businessId"]??0,
    memberId: json["memberId"]??0,
    samajId: json["samajId"]??0,
    businessType: json["businessType"]??'',
    businessName: json["businessName"]??'',
    memberName: json["memberName"]??'',
    village: json["village"]??'',
    mobileNumber: json["mobileNumber"]??'',
    whatsappNumber: json["whatsappNumber"]??'',
    visitingCard: json["visitingCard"]??'',
    isApprove: json["isApprove"]??'',
    // businessDetails: json["businessDetails"],
    // businessAddress: json["businessAddress"],
    // createdOn: json["createdOn"],
    // createdBy: json["createdBy"],
    // createdUserTypeId: json["createdUserTypeId"],
    // modifiedOn: json["modifiedOn"],
    // modifiedBy: json["modifiedBy"],
    // modifiedUserTypeId: json["modifiedUserTypeId"],
    // deletedOn: json["deletedOn"],
    // isDelete: json["isDelete"],
    // deletedBy: json["deletedBy"],
    // deletedUserTypeId: json["deletedUserTypeId"],
    // samajName: json["samajName"],
  );

  Map<String, dynamic> toJson() => {
    "businessId": businessId,
    "memberId": memberId,
    "samajId": samajId,
    "businessType": businessType,
    "businessName": businessName,
    "memberName": memberName,
    "village": village,
    "mobileNumber": mobileNumber,
    "whatsappNumber": whatsappNumber,
    "visitingCard": visitingCard,
    "isApprove": isApprove,
    // "businessAddress": businessAddress,
    // "businessDetails": businessDetails,
    // "createdOn": createdOn,
    // "createdBy": createdBy,
    // "createdUserTypeId": createdUserTypeId,
    // "modifiedOn": modifiedOn,
    // "modifiedBy": modifiedBy,
    // "modifiedUserTypeId": modifiedUserTypeId,
    // "deletedOn": deletedOn,
    // "isDelete": isDelete,
    // "deletedBy": deletedBy,
    // "deletedUserTypeId": deletedUserTypeId,
    // "samajName": samajName,
  };
}
