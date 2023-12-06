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

class DonationController extends GetxController {

  RxList<dynamic> item = [
    'Money Donation','Blood Donation','Organ Donation','Other Donation'
  ].obs;

  RxList<dynamic> image = [
    './assets/md.png','./assets/bd.png','./assets/od.png','./assets/otd.png'
  ].obs;

  RxList<dynamic> screens = [
    Routes.moneyDonation ,Routes.bloodDonation,Routes.organDonation,Routes.otherDonation
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
