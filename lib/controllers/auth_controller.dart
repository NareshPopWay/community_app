import 'package:community_app/splash_screen.dart';
import 'package:community_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<Widget> displayWidget = Rx<Widget>(const SplashScreen());
  RxBool visible = false.obs;
  RxBool isAlredyLogin = false.obs;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(milliseconds: 500));
    visible.value = true;
    checkUserIsLoginOrNot();
  }

  checkUserIsLoginOrNot() async {
    await Future.delayed(const Duration(seconds: 3));
    displayWidget.value = const HomeScreen();
  }
}
