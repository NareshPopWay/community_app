import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/BusinessController/business_controller.dart';
import 'package:community_app/models/job_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/business_model.dart';
import '../../models/field_item_value_model.dart';

class AddBusinessController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  Rx<String> aboutNotification = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;

  BusinessController businessController = Get.put(BusinessController());

  Rx<TextEditingController> memberNameController = TextEditingController().obs;
  Rx<TextEditingController> villageController = TextEditingController().obs;
  Rx<TextEditingController> BusinessNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> whatsappNumberController = TextEditingController().obs;



  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }


  RxString selectedBusinessType = "".obs;
  RxString selectedBusinessTypeId = "".obs;
  RxBool isBusinessTypeExpanded = false.obs;
  RxList<FieldItemValueModel> businessTypeList=[
    FieldItemValueModel(text: 'civilConstruction',value: 1),
    FieldItemValueModel(text: 'digital',value: 2),
    FieldItemValueModel(text: 'food',value: 3),
    FieldItemValueModel(text: 'health',value: 4),
    FieldItemValueModel(text: 'semiIndustries',value: 5),
    FieldItemValueModel(text: 'investment',value: 6),
    FieldItemValueModel(text: 'retailOutlets',value: 7),
    FieldItemValueModel(text: 'textiles',value: 8),
    FieldItemValueModel(text: 'eventManagement',value: 9),
    FieldItemValueModel(text: 'other',value: 10),
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

  Future addBusiness() async{
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

    var saveImageResponse = await APIProvider().saveBusinessImage(apiToken:token.value,imageFile:selectedFile.value!.path);

    log('Image Name : ${saveImageResponse.toString()}');

    if(saveImageResponse != ''){
      bool addNotificationResponse = await APIProvider().addBusiness(
          apiToken: token.value,
          businessDetails: BusinessModel(
              visitingCard: saveImageResponse,
              memberName: memberNameController.value.text,
              mobileNumber: mobileNumberController.value.text,
              whatsappNumber: whatsappNumberController.value.text,
              businessName: BusinessNameController.value.text,
              village: villageController.value.text,
              businessType: selectedBusinessType.value,
              businessId: 0,
              memberId: 0,
              isApprove:false,
              samajId: 0
          )
      );

      if(addNotificationResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Business Added SuccessFully..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        selectedFile.value = null;
        selectedBusinessType.value = "";
        memberNameController.value.clear();
        villageController.value.clear();
        BusinessNameController.value.clear();
        mobileNumberController.value.clear();
        whatsappNumberController.value.clear();

        businessController.businessList.clear();
        businessController.getBusiness();

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
