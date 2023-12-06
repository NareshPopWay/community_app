import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/routes/page_routes.dart';
import 'package:community_app/view/Notification/education_news_screen.dart';
import 'package:community_app/view/Notification/good_news_screen.dart';
import 'package:community_app/view/Notification/gov_news_screen.dart';
import 'package:community_app/view/Notification/other_news_screen.dart';
import 'package:community_app/view/Notification/sad_news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';

class RequestController extends GetxController {

  RxList<dynamic> item = [
    'Medial Request','Scholarship Request','Other Request'
  ].obs;

  RxList<dynamic> image = [
    './assets/mr.jpeg','./assets/sr.png','./assets/or.png',
  ].obs;

  RxList<dynamic> screens = [
    Routes.medicalRequest,Routes.scholarshipRequest,Routes.otherRequest
  ].obs;

  RxString userTypeId="".obs;
  @override
  void onInit() async {
    super.onInit();
    userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    if (userTypeId.value == "") {
      userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    }
  }


}
