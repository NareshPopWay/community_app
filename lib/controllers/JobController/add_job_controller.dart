import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/models/job_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/field_item_value_model.dart';

class AddJobController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;



  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<TextEditingController> memberNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> whatsappNumberController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> jobForController = TextEditingController().obs;
  Rx<TextEditingController> jobLocationController = TextEditingController().obs;
  Rx<TextEditingController> salaryController = TextEditingController().obs;
  Rx<TextEditingController> jobDetailsController = TextEditingController().obs;


  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }


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

  Future addJob() async{
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

    var saveImageResponse = await APIProvider().saveJobImage(apiToken:token.value,imageFile:selectedFile.value!.path);

    log('Image Name : ${saveImageResponse.toString()}');

    if(saveImageResponse != ''){
      bool addNotificationResponse = await APIProvider().addJob(
          apiToken: token.value,
          jobDetails: JobModel(
              visitingCard: saveImageResponse,
              memberName: memberNameController.value.text,
              address: addressController.value.text,
              companyName: companyNameController.value.text,
              website: websiteController.value.text,
              email: emailController.value.text,
              mobileNumber: mobileNumberController.value.text,
              whatsappNumber: whatsappNumberController.value.text,
              jobFor: jobForController.value.text,
              jobLocation: jobLocationController.value.text,
              jobDetails: jobDetailsController.value.text,
              salary: salaryController.value.text,
              isApprove:false,
              samajId: 0,
              memberId:0 ,
              jobId: 0,
              requiredEducation: ''
          )

      );

      if(addNotificationResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Job Added SuccessFully..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        selectedFile.value = null;

        companyNameController.value.clear();
        addressController.value.clear();
        websiteController.value.clear();
        memberNameController.value.clear();
        mobileNumberController.value.clear();
        whatsappNumberController.value.clear();
        emailController.value.clear();
        jobForController.value.clear();
        jobLocationController.value.clear();
        salaryController.value.clear();
        jobDetailsController.value.clear();
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
