
import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/request_model.dart';

class MedicalRequestController extends GetxController {

  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxList<RequestModel> medicalRequestList = <RequestModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
    getMedicalRequest();
  }

  Future<void> getMedicalRequest() async {
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

    var medicalRequestResponse = await APIProvider().getMedicalRequest(token.value);
    if (medicalRequestResponse.isNotEmpty) {
      medicalRequestList.addAll(medicalRequestResponse);
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
