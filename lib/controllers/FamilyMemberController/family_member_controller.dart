import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/models/family_member_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FamilyMemberController extends GetxController {

  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxList<FamilyMemberModel> familyMemberList = <FamilyMemberModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
    }
    getFamilyMember();
  }

  Future<void> getFamilyMember() async {
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

    var familyMemberResponse = await APIProvider().getFamilyMember(token.value);
    if (familyMemberResponse.isNotEmpty) {
      familyMemberList.addAll(familyMemberResponse);
      isLoading.value = false;
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