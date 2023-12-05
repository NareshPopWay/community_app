import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MemberController/member_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/PMemberModel.dart';
import '../../models/field_item_value_model.dart';

class AddMemberController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;

  MemberController memberController = Get.put(MemberController());


  Rx<TextEditingController> memberNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> areaController = TextEditingController().obs;
  Rx<TextEditingController> villageController = TextEditingController().obs;
  Rx<TextEditingController> sakheController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  @override
  void onInit() async {
    super.onInit();
    RequestTypeList.value = await APIProvider().getRequestType();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
  }

  RxString selectedRequestType = "".obs;
  RxString selectedRequestTypeId = "".obs;
  RxBool isRequestTypeExpanded = false.obs;
  RxList<FieldItemValueModel> RequestTypeList = <FieldItemValueModel>[].obs;

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

  Future addMember() async{
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

    var saveImageResponse = await APIProvider().saveMemberImage(apiToken:token.value,imageFile:selectedFile.value!.path);

    log('Image Name : ${saveImageResponse.toString()}');

    if(saveImageResponse != ''){
      bool memberRegistrationResponse = await APIProvider().createMember(PMember(
          memberName: memberNameController.value.text,
          address: addressController.value.text,
          area: areaController.value.text,
          village: villageController.value.text,
          sakhe: sakheController.value.text,
          mobileNumber: mobileNumberController.value.text,
          username: usernameController.value.text,
          password: passwordController.value.text
      ));

      if(memberRegistrationResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Member Register SuccessFully..",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        selectedFile.value = null;
        memberNameController.value.clear();
        addressController.value.clear();
        areaController.value.clear();
        villageController.value.clear();
        sakheController.value.clear();
        mobileNumberController.value.clear();
        usernameController.value.clear();
        passwordController.value.clear();
        memberController.memberList.clear();
        memberController.getMember();
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
