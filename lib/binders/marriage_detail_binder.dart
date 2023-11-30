import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MarriageController/marriage_details_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/MarriageController/marriage_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

class MarriageDetailsBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => MarriageDetailController());

  }
}
