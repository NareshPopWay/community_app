// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/splash_screen.dart';
import 'package:community_app/view/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app_notification/notification.dart';
import '../common/api_constant.dart';
import 'MemberController/member_controller.dart';
import 'NotificationController/notification_controller.dart';

class AuthController extends GetxController {
  Rx<Widget> displayWidget = Rx<Widget>(const SplashScreen());
  RxBool visible = false.obs;
  RxBool isAlredyLogin = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString pageTitle = ''.obs;
  RxString token = "".obs;
  RxString userTypeId="".obs;

  MemberController memberController = Get.put(MemberController());
  NotificationController notificationController = Get.put(NotificationController());

  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == null) {
      token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
    log('Token ${token.value}');
    await Future.delayed(const Duration(milliseconds: 500));
    visible.value = true;
    if(token.value == 'null'){
      getToken();
    }else{
      checkUserIsLoginOrNot();
    }
    onItemTap(selectedIndex.value);


  }

  void onItemTap(int index) {
    if (index == 0) {
        pageTitle.value = 'Home';
    }
    if (index == 1) {
        pageTitle.value = 'Member';
    }
    if (index == 2) {
        pageTitle.value = 'Committee';
    }
    if (index == 3) {
        pageTitle.value = 'Notification';
    }
  }

  Future<void> getToken() async {
    bool isInternet = await Constants.isInternetAvail();
    if (!isInternet) {
      Constants.ErrorSnackBar(message: "No Internet connection");
      return;
    }
    try{

      bool login = await APIProvider().getToken();

      if (login == true) {
        checkUserIsLoginOrNot();
      }else{
        Fluttertoast.showToast(
            msg: "Something went wrong..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }catch(e){
      Constants.ErrorSnackBar(title: '$e');
    }
  }


  checkUserIsLoginOrNot() async {
    userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    if (userTypeId.value == "") {
      userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    }
    log('UserType ID  ${userTypeId.value}');
    memberController.userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    memberController.onInit();
    notificationController.userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    notificationController.onInit();
    // await APIProvider().saveFCMToken();
    // AppNotification().initiosPermission();
    // AppNotification().notificationListener();
    // // AppNotification(). badger();
    // // AppNotification().backgroundSetting();
    //
    // await FirebaseMessaging.instance.subscribeToTopic('Community');
    //
    // // firebaseToken = await FirebaseMessaging.instance.getToken();
    // // log('FirebaseToken : $firebaseToken');

    await Future.delayed(const Duration(seconds: 3));
    displayWidget.value = const HomeScreen();
  }
}
