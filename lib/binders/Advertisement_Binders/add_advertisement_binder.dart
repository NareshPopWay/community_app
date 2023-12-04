import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/AdvertisementController/add_advertisement_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

import '../../controllers/BusinessController/add_business_controller.dart';

class AddAdvertisementBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => AddAdvertisementController());

  }
}
