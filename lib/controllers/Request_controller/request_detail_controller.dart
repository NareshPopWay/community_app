import 'package:community_app/models/request_model.dart';
import 'package:get/get.dart';


class RequestDetailController extends GetxController {

  RequestModel? model;

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
