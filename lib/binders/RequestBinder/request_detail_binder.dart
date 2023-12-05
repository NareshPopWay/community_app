import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/Request_controller/requesr_controller.dart';
import 'package:community_app/controllers/Request_controller/request_detail_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

class RequestDetailBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => RequestDetailController());

  }
}
