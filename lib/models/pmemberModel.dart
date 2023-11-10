
class PMember {
  // int memberId;
  // int samajId;
  // String memberNumber;
  String memberName;
  String address;
  String area;
  String village;
  String sakhe;
  String mobileNumber;
  String username;
  String password;
  // String samajName;

  PMember({
    // required this.memberId,
    // required this.samajId,
    // required this.memberNumber,
    required this.memberName,
    required this.address,
    required this.area,
    required this.village,
    required this.sakhe,
    required this.mobileNumber,
    required this.username,
    required this.password,
    // required this.samajName,
  });

  factory PMember.fromJson(Map<String, dynamic> json) => PMember(
    // memberId: json["memberId"],
    // samajId: json["samajId"],
    // memberNumber: json["memberNumber"],
    memberName: json["memberName"],
    address: json["address"],
    area: json["area"],
    village: json["village"],
    sakhe: json["sakhe"],
    mobileNumber: json["mobileNumber"],
    username: json["username"],
    password: json["password"],
    // samajName: json["samajName"],
  );

  Map<String, dynamic> toJson() => {
    // "memberId": memberId,
    // "samajId": samajId,
    // "memberNumber": memberNumber,
    "memberName": memberName,
    "address": address,
    "area": area,
    "village": village,
    "sakhe": sakhe,
    "mobileNumber": mobileNumber,
    "username": username,
    "password": password,
    // "samajName": samajName,
  };
}

