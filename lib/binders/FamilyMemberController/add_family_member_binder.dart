import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/FamilyMemberController/family_member_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/root_controller.dart';
import 'package:get/get.dart';

import '../../controllers/FamilyMemberController/add_family_member_controller.dart';

class AddFamilyMemberBinder extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ThemeService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RootController());
    Get.lazyPut(() => FamilyMemberController());
    Get.lazyPut(() => AddFamilyMemberController());

  }
}
