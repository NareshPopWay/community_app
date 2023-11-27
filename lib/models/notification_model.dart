
class NotificationModel {
  int notificationId;
  int samajId;
  String fileData;
  String aboutNotification;
  int notificationType;
  bool isApprove;


  NotificationModel({
    required this.notificationId,
    required this.samajId,
    required this.fileData,
    required this.aboutNotification,
    required this.notificationType,
    required this.isApprove,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    notificationId: json["notificationId"]??0,
    samajId: json["samajId"]??0,
    fileData: json["fileData"]??'',
    aboutNotification: json["aboutNotification"]??'',
    notificationType: json["notificationType"]??0,
    isApprove: json["isApprove"]??false,

  );

  Map<String, dynamic> toJson() => {
    "notificationId": notificationId,
    "samajId": samajId,
    "fileData": fileData,
    "aboutNotification": aboutNotification,
    "notificationType": notificationType,
    "isApprove": isApprove,
  };
}


