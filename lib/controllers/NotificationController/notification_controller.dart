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

class NotificationController extends GetxController {

  RxList<dynamic> item = [
  'Good News','Sad News','Education News','Government News','Other News'
  ].obs;

  RxList<dynamic> image = [
  './assets/sm.jpg','./assets/sd.jpg','./assets/book.png','./assets/gov.png','./assets/other.png'
  ].obs;

  RxList<dynamic> screens = [
    Routes.goodNews ,Routes.sadNews,Routes.eduNews,Routes.govNews,Routes.otherNews
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
