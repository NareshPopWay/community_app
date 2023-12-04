import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/controllers/MarriageController/marriage_controller.dart';
import 'package:community_app/models/marriage_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/themeService.dart';
import '../../models/field_item_value_model.dart';

class AddMarriageController extends GetxController {

  RxBool isLoading = false.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  RxString token="".obs;

  Rx<TextEditingController> dateinput = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> remarkController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> whatsappNumberController = TextEditingController().obs;
  Rx<TextEditingController> sakheController = TextEditingController().obs;
  Rx<TextEditingController> villageController = TextEditingController().obs;
  Rx<TextEditingController> hobbyController = TextEditingController().obs;
  Rx<TextEditingController> heightController = TextEditingController().obs;
  Rx<TextEditingController> weightController = TextEditingController().obs;
  Rx<TextEditingController> monthlyIncomeController = TextEditingController().obs;

  Rx<TextEditingController> fatherNameController = TextEditingController().obs;
  Rx<TextEditingController> fatherOccupationController = TextEditingController().obs;
  Rx<TextEditingController> fatherMobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> fatherIncomeController = TextEditingController().obs;
  Rx<TextEditingController> motherNameController = TextEditingController().obs;
  Rx<TextEditingController> motherOccupationController = TextEditingController().obs;

  Rx<TextEditingController> numberOfBrotherController = TextEditingController().obs;
  Rx<TextEditingController> numberOfSisterController = TextEditingController().obs;
  Rx<TextEditingController> mosalController = TextEditingController().obs;

  DateTime birthDate = DateTime.now();
  RxBool step1Loading = false.obs;
  RxBool step2Loading = false.obs;
  RxBool step3Loading = false.obs;
  RxInt currentStep = 0.obs;

  MarriageController marriageController = Get.put(MarriageController());

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


  RxString selectedGender = "".obs;
  RxString selectedGenderId = "".obs;
  RxBool isGenderExpanded = false.obs;
  RxList<FieldItemValueModel> genderList=[
    FieldItemValueModel(text: 'Male',value: 1),
    FieldItemValueModel(text: 'Female',value: 2),
    FieldItemValueModel(text: 'Other',value: 3),
  ].obs;

  RxString selectedEducation = "".obs;
  RxString selectedEducationId = "".obs;
  RxBool isEducationExpanded = false.obs;
  RxList<FieldItemValueModel> educationList=[
    FieldItemValueModel(text: 'Tenth',value: 1),
    FieldItemValueModel(text: 'Twelth',value: 2),
    FieldItemValueModel(text: 'Graduation',value: 3),
    FieldItemValueModel(text: 'Pgraduation',value: 4),
    FieldItemValueModel(text: 'Master',value: 5),
    FieldItemValueModel(text: 'Mphil',value: 6),
    FieldItemValueModel(text: 'Phd',value: 7),
    FieldItemValueModel(text: 'Other',value: 8),
  ].obs;

  RxString selectedOccupation = "".obs;
  RxString selectedOccupationId = "".obs;
  RxBool isOccupationExpanded = false.obs;
  RxList<FieldItemValueModel> occupationList=[
    FieldItemValueModel(text: 'Job',value: 1),
    FieldItemValueModel(text: 'Business',value: 2),
    FieldItemValueModel(text: 'Study',value: 3),
    FieldItemValueModel(text: 'Other',value: 4),
  ].obs;


  RxString selectedMarital = "".obs;
  RxString selectedMaritalId = "".obs;
  RxBool isMaritalExpanded = false.obs;
  RxList<FieldItemValueModel> maritalList=[
    FieldItemValueModel(text: 'Single',value: 1),
    FieldItemValueModel(text: 'Engaged',value: 2),
    FieldItemValueModel(text: 'Married',value: 3),
    FieldItemValueModel(text: 'Divorce',value: 4),
    FieldItemValueModel(text: 'Widowed',value: 5),
  ].obs;


  Future marriageRegistration() async{
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

    var saveImageResponse = await APIProvider().saveMarriageImage(apiToken:token.value,imageFile:selectedFile.value!.path);

    log('Image Name : ${saveImageResponse.toString()}');

    if(saveImageResponse != ''){
      bool addNotificationResponse = await APIProvider().marriageRegistration(
          apiToken: token.value,
          marriageDetails:MarriageModel(
              name: nameController.value.text,
              gender: selectedGender.value,
              birthDate: DateTime.parse(dateinput.value.text),
              maritalStatus: selectedMarital.value,
              mobileNumber: mobileNumberController.value.text,
              whatsappNumber: whatsappNumberController.value.text,
              qualification: selectedEducation.value,
              occupation: selectedOccupation.value,
              monthlyIncome: monthlyIncomeController.value.text,
              sakhe: sakheController.value.text,
              hobby: hobbyController.value.text,
              remark: remarkController.value.text,
              village: villageController.value.text,
              mosal: mosalController.value.text,
              hight: heightController.value.text,
              weight: weightController.value.text,
              fileData: saveImageResponse,
              fatherName: fatherNameController.value.text,
              fatherMobileNumber: fatherMobileNumberController.value.text,
              fatherOccupation: fatherOccupationController.value.text,
              fatherIncome: fatherIncomeController.value.text,
              motherName: motherNameController.value.text,
              motherOccupation: motherOccupationController.value.text,
              numberOfBrother: numberOfBrotherController.value.text,
              numberOfSister: numberOfSisterController.value.text,
              address: addressController.value.text,
              memberId: 0,
              samajId: 0,
              isApprove:false,
              marriageId: 0,
              motherIncome: '',
              motherMobileNumber: '',
              samajName: ''
          )
      );

      if(addNotificationResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Marriage Registration SuccessFully Done",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        selectedFile.value = null;
        dateinput.value.clear();
        nameController.value.clear();
        addressController.value.clear();
        remarkController.value.clear();
        mobileNumberController.value.clear();
        whatsappNumberController.value.clear();
        sakheController.value.clear();
        villageController.value.clear();
        hobbyController.value.clear();
        heightController.value.clear();
        weightController.value.clear();
        monthlyIncomeController.value.clear();
        fatherNameController.value.clear();
        fatherOccupationController.value.clear();
        fatherMobileNumberController.value.clear();
        fatherIncomeController.value.clear();
        motherNameController.value.clear();
        motherOccupationController.value.clear();
        numberOfBrotherController.value.clear();
        numberOfSisterController.value.clear();
        mosalController.value.clear();
        marriageController.marriageList.clear();
        marriageController.getMarriage();
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
