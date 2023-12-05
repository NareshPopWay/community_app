import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MarkSheetController/marksheet_controller.dart';
import 'package:community_app/models/job_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/field_item_value_model.dart';
import '../../models/marksheet_model.dart';

class AddMarksheetController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;

  MarksheetController marksheetController = Get.put(MarksheetController());

  Rx<TextEditingController> studentNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> qualificationController = TextEditingController().obs;
  Rx<TextEditingController> villageController = TextEditingController().obs;


  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }


  RxString selectedMediumType = "".obs;
  RxString selectedMediumTypeId = "".obs;
  RxBool isMediumTypeExpanded = false.obs;
  RxList<FieldItemValueModel> mediumTypeList=[
    FieldItemValueModel(text: 'English',value: 1),
    FieldItemValueModel(text: 'Gujarati',value: 2),
    FieldItemValueModel(text: 'other',value: 3),

  ].obs;



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

  Future addMarksheet() async{
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

    var saveImageResponse = await APIProvider().saveMarksheetImage(apiToken:token.value,imageFile:selectedFile.value!.path);

    log('Image Name : ${saveImageResponse.toString()}');

    if(saveImageResponse != ''){
      bool addNotificationResponse = await APIProvider().addMarksheet(
          apiToken: token.value,
          markSheetDetails: MarksheetModel(
              marksheetImage: saveImageResponse,
              studentName: studentNameController.value.text,
              mobileNumber: mobileNumberController.value.text,
              village: villageController.value.text,
              qualification: qualificationController.value.text,
              mediumType: selectedMediumType.value,
              memberId:0 ,
              samajId: 0,
              samajName:'' ,
              isApprove: false,
              marksheetId: 0
          )

      );

      if(addNotificationResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Marksheet Added SuccessFully..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        selectedFile.value = null;
        selectedMediumType.value = "";
        studentNameController.value.clear();
        mobileNumberController.value.clear();
        qualificationController.value.clear();
        villageController.value.clear();

         marksheetController.marksheetList.clear();
         marksheetController.getMarksheet();

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
