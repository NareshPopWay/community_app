import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/AdvertisementController/advertisement_controller.dart';
import 'package:community_app/controllers/BusinessController/business_detail_controller.dart';
import 'package:community_app/controllers/JobController/job_detail_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

import '../../controllers/AdvertisementController/advertisement_detail_controller.dart';

class AdvertisementDetailBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => AdvertisementDetailController());

  }
}
