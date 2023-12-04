import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/FeedBack/feedback_controller.dart';
import 'package:community_app/controllers/JobController/job_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

class FeedBackBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => FeedBackController());

  }
}
