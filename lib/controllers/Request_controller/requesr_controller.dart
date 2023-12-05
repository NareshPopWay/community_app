import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/routes/page_routes.dart';
import 'package:community_app/view/Notification/education_news_screen.dart';
import 'package:community_app/view/Notification/good_news_screen.dart';
import 'package:community_app/view/Notification/gov_news_screen.dart';
import 'package:community_app/view/Notification/other_news_screen.dart';
import 'package:community_app/view/Notification/sad_news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  @override
  void onInit() async {
    super.onInit();

  }


}
