import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    if (!(Get.isRegistered<AuthController>())) {
      Get.lazyPut(() => AuthController());
    }
    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => RootController());

  }
}
