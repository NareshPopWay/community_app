import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/FeedBack/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/feedback_model.dart';

class AddFeedController extends GetxController {

  FeedBackController feedBackController = Get.put(FeedBackController());


  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;


  Rx<TextEditingController> memberNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> feedbackController = TextEditingController().obs;
  Rx<TextEditingController> villageController = TextEditingController().obs;



  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }


  Future addFeedBack() async{
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


      bool addFeedBackResponse = await APIProvider().addFeedBack(
          apiToken: token.value,
          feedbackDetails: FeedbackModel(
            memberName: memberNameController.value.text,
            village: villageController.value.text,
            mobileNumber: mobileNumberController.value.text,
            feedbacks: feedbackController.value.text,
            samajName:'',
            samajId: 0,
            memberId:0 ,
            feedbackId: 0,
          )

      );

      if(addFeedBackResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "FeedBack Added SuccessFully..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        memberNameController.value.clear();
        mobileNumberController.value.clear();
        feedbackController.value.clear();
        villageController.value.clear();
        feedBackController.feedBackList.clear();
        feedBackController.getFeedBack();
        Get.back();
      }else{
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Something Went Wrong..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

  }


}
