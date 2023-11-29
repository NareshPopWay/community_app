import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/field_item_value_model.dart';

class AddNotificationController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  Rx<String> aboutNotification = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;



  Rx<TextEditingController> AboutNotificationController = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    NotificationItemList.value = await APIProvider().getAllType();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }

  RxString selectedNotificationItem = "".obs;
  RxString selectedNotificationItemId = "".obs;
  RxBool isNotificationItemExpanded = false.obs;
  RxList<FieldItemValueModel> NotificationItemList = <FieldItemValueModel>[].obs;

  RxString getFilePath = "".obs;
  Rx<File?> selectedFile = Rx(null);

  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result?.files.single.path != null) {
      String path = result!.files.single.path!;
      File file = File(path);
      selectedFile.value = file;
    }
  }

  Future addNotification() async{
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

    var saveImageResponse = await APIProvider().saveImage(apiToken:token.value,imageFile:selectedFile.value!.path);

      log('Image Name : ${saveImageResponse.toString()}');

      if(saveImageResponse != ''){
        bool addNotificationResponse = await APIProvider().addNotification(
            apiToken: token.value,
            aboutNotification: AboutNotificationController.value.text,
            notificationType: selectedNotificationItemId.value,
            fileData: saveImageResponse.toString()
        );

        if(addNotificationResponse == true){
          isLoading.value = false;
          Fluttertoast.showToast(
              msg: "Notification Added SuccessFully..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: ThemeService.black,
              fontSize: 16.0);
          AboutNotificationController.value.clear();
          selectedNotificationItemId.value = '';
          selectedNotificationItem.value = '';
          selectedFile.value = null;
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
