// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/splash_screen.dart';
import 'package:community_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/api_constant.dart';

class AuthController extends GetxController {
  Rx<Widget> displayWidget = Rx<Widget>(const SplashScreen());
  RxBool visible = false.obs;
  RxBool isAlredyLogin = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString pageTitle = ''.obs;
  RxString token = "".obs;
  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
    if (token.value == null) {
      token.value =   GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
    }
    log('Token ${token.value}');
    await Future.delayed(const Duration(milliseconds: 500));
    visible.value = true;
    onItemTap(selectedIndex.value);
    getToken();
  }

  void onItemTap(int index) {
    if (index == 0) {
        pageTitle.value = 'Member';
    }
    if (index == 1) {
        pageTitle.value = 'Committee';
    }
    if (index == 2) {
        pageTitle.value = 'Notification';
    }
    if (index == 3) {
        pageTitle.value = 'AboutUs';
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
            msg: "Invalid",
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
    await Future.delayed(const Duration(seconds: 3));
    displayWidget.value = const HomeScreen();
  }
}
