
class MemberModel {
  int familyMemberId;
  int memberId;
  int samajId;
  String familyMemberName;
  String relation;
  String address;
  String area;
  String gender;
  String mobileNumber;
  String whatsappNumber;
  DateTime birthDate;
  String email;
  String education;
  String maritalStatus;
  String occupation;
  String bloodGroup;
  String fileData;
  String isAdmin;
  String village;
  String sakhe;

  MemberModel({
    required this.familyMemberId,
    required this.memberId,
    required this.familyMemberName,
    required this.relation,
    required this.samajId,
    required this.address,
    required this.area,
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
    required this.isAdmin,
    required this.village,
    required this.sakhe,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      familyMemberId: json["familyMemberId"]??0,
      memberId: json["memberId"]??0,
      samajId: json["samajId"]??0,
      familyMemberName: json["familyMemberName"]??"",
      relation: json["relation"]??"",
      address: json["address"]??"",
      area: json["area"]??"",
      gender: json["gender"]??"",
      mobileNumber: json["mobileNumber"]??"",
      whatsappNumber: json["whatsappNumber"]??"",
      birthDate: DateTime.parse(json["birthDate"]),
      email: json["email"]??"",
      education: json["education"]??"",
      maritalStatus: json["maritalStatus"]??"",
      occupation: json["occupation"]??"",
      bloodGroup: json["bloodGroup"]??"",
      fileData: json["fileData"]??"",
      isAdmin: json["isAdmin"]??"",
      village: json["village"]??"",
      sakhe: json["sakhe"]??"",
    );
  }

  Map<String, dynamic> toJson() => {
    "familyMemberId": familyMemberId,
    "memberId": memberId,
    "samajId": samajId,
    "familyMemberName": familyMemberName,
    "relation": relation,
    "address": address,
    "area": area,
    "gender": gender,
    "mobileNumber": mobileNumber,
    "whatsappNumber": whatsappNumber,
    "birthDate": birthDate.toIso8601String(),
    "email": email,
    "education": education,
    "maritalStatus": maritalStatus,
    "occupation": occupation,
    "bloodGroup": bloodGroup,
    "fileData": fileData,
    "isAdmin": isAdmin,
    "village": village,
    "sakhe": sakhe,
  };
}
