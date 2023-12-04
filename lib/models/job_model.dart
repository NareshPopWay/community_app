
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
  String requiredEducation;
  bool isApprove;

  // String samajName;
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
  JobModel(
      {
        required this.jobId,
        required  this.memberId,
        required this.memberName,
        required this.samajId,
        required this.mobileNumber,
        required  this.whatsappNumber,
        required  this.companyName,
        required  this.address,
        required this.website,
        required this.email,
        required this.jobFor,
        required this.jobLocation,
        required  this.jobDetails,
        required this.visitingCard,
        required this.salary,
        required this.requiredEducation,
        required this.isApprove});


  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    jobId: json["jobId"]??0,
    memberId: json["memberId"]??0,
    memberName: json["memberName"]??'',
    samajId: json["samajId"]??0,
    mobileNumber: json["mobileNumber"]??'',
    whatsappNumber: json["whatsappNumber"]??'',
    companyName: json["companyName"]??'',
    address: json["address"]??'',
    website: json["website"]??'',
    email: json["email"]??'',
    jobFor: json["jobFor"]??'',
    jobLocation: json["jobLocation"]??'',
    jobDetails: json["jobDetails"]??'',
    visitingCard: json["visitingCard"]??'',
    salary: json["salary"]??'',
    isApprove: json["isApprove"]??false,
    requiredEducation: json["requiredEducation"]??'',
    // samajName: json["samajName"],
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
    // "requiredEducation": requiredEducation,
    // "samajName": samajName,
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
  };
}
