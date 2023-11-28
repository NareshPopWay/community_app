import 'package:community_app/models/notification_model.dart';
import 'package:get/get.dart';

import '../../models/member_model.dart';

class MemberDetailController extends GetxController {

  MemberModel? model;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      model = Get.arguments;
    } else if (Get.arguments != null) {
      model = Get.arguments.toJson();
    }
  }


}
