import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/NotificationController/education_news_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/member_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

class EducationNewsBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => EducationNewsController());

  }
}
