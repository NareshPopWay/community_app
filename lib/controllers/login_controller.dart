import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/models/family_member_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/themeService.dart';

class LoginController extends GetxController {

  final key = new GlobalKey<FormState>();
  RxBool secureText = true.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;

  Rx<TextEditingController> userName = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;

  AuthController authController = Get.put(AuthController());

  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    bool isInternet = await Constants.isInternetAvail();
    if (!isInternet) {
      isLoading.value = false;
      Constants.ErrorSnackBar(message: "No Internet connection");
      Fluttertoast.showToast(
          msg: "No Internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    bool loginResponse = await APIProvider().login(Username:userName.value.text, Password:password.value.text);
    if (loginResponse == true) {
      isLoading.value = false;
      Fluttertoast.showToast(
          msg: 'Login successfully done',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: ThemeService.black,
          fontSize: 16.0);
       authController.userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
       Get.offNamed(Routes.home);
    }
    else {
      isLoading.value = false;
      // Fluttertoast.showToast(
      //     msg: "Something went wrong..",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.SNACKBAR,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.amberAccent,
      //     textColor: Colors.black,
      //     fontSize: 16.0);
    }
  }

  Future<void> adminLogin() async {
    isLoading.value = true;
    bool isInternet = await Constants.isInternetAvail();
    if (!isInternet) {
      isLoading.value = false;
      Constants.ErrorSnackBar(message: "No Internet connection");
      Fluttertoast.showToast(
          msg: "No Internet connection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    bool loginResponse = await APIProvider().adminLogin(Username:userName.value.text, Password:password.value.text);
    if (loginResponse == true) {
      isLoading.value = false;
      Fluttertoast.showToast(
          msg: 'Login successfully done',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: ThemeService.black,
          fontSize: 16.0);
     // authController.token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
      authController.userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
      Get.offNamed(Routes.home);
    }
    else {
      isLoading.value = false;
      // Fluttertoast.showToast(
      //     msg: "Something went wrong..",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.SNACKBAR,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.amberAccent,
      //     textColor: Colors.black,
      //     fontSize: 16.0);
    }
  }
}
