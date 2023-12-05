import 'package:community_app/models/donation_model.dart';
import 'package:get/get.dart';


class DonationDetailController extends GetxController {

  DonationModel? model;

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
