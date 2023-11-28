import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MemberController/member_detail_controller.dart';
import 'package:community_app/controllers/NotificationController/gov_news_controller.dart';
import 'package:community_app/controllers/NotificationController/notification_details_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/MemberController/member_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

class MemberDetailsBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => MemberDetailController());

  }
}
