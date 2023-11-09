import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/splash_screen.dart';
import 'package:community_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    getToken();
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
