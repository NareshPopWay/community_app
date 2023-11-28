import 'package:get/get.dart';
import '../../models/notification_model.dart';

class NotificationDetailsController extends GetxController {

  NotificationModel? model;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null ) {
      model = Get.arguments;
    } else if (Get.arguments != null) {
      model = Get.arguments.toJson();
    }
  }


}
