import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/constant.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/FamilyMemberController/family_member_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/api_constant.dart';
import '../../common/api_provider.dart';
import '../../models/family_member_model.dart';
import '../../models/field_item_value_model.dart';

class AddFamilyMemberController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  Rx<String> aboutNotification = ''.obs;
  RxBool isLoading = false.obs;
  RxString token="".obs;

  FamilyMemberController familyMemberController = Get.put(FamilyMemberController());

  Rx<TextEditingController> dateinput = TextEditingController().obs;
  Rx<TextEditingController> familymemberNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> areaController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> whatsappNumberController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();

    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
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

  RxString selectedRelation = "".obs;
  RxString selectedRelationId = "".obs;
  RxBool isRelationExpanded = false.obs;
  RxList<FieldItemValueModel> relationList=[
    FieldItemValueModel(text: 'Own',value: 1),
    FieldItemValueModel(text: 'Father',value: 2),
    FieldItemValueModel(text: 'Mother',value: 3),
    FieldItemValueModel(text: 'Wife',value: 4),
    FieldItemValueModel(text: 'Son',value: 5),
    FieldItemValueModel(text: 'Daughter',value: 6),
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

  RxString selectedOccupation = "".obs;
  RxString selectedOccupationId = "".obs;
  RxBool isOccupationExpanded = false.obs;
  RxList<FieldItemValueModel> occupationList=[
    FieldItemValueModel(text: 'Job',value: 1),
    FieldItemValueModel(text: 'Business',value: 2),
    FieldItemValueModel(text: 'Study',value: 3),
    FieldItemValueModel(text: 'Other',value: 4),
  ].obs;

  RxString selectedBloodGroup = "".obs;
  RxString selectedBloodGroupId = "".obs;
  RxBool isBloodGroupExpanded = false.obs;
  RxList<FieldItemValueModel> bloodGroupList=[
    FieldItemValueModel(text: 'A+',value: 1),
    FieldItemValueModel(text: 'A-',value: 2),
    FieldItemValueModel(text: 'B+',value: 3),
    FieldItemValueModel(text: 'B-',value: 4),
    FieldItemValueModel(text: 'O+',value: 5),
    FieldItemValueModel(text: 'O-',value: 6),
    FieldItemValueModel(text: 'AB+',value: 7),
    FieldItemValueModel(text: 'AB-',value: 8),
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

  Future addFamilyMember() async{
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

    var saveImageResponse = await APIProvider().saveFamilyMemberImage(apiToken:token.value,imageFile:selectedFile.value!.path);

    log('Image Name : ${saveImageResponse.toString()}');

    if(saveImageResponse != ''){
      bool addNotificationResponse = await APIProvider().addFamilyMember(
       apiToken: token.value,
        members:  FamilyMemberModel(
            fileData: saveImageResponse,
            familyMemberName: familymemberNameController.value.text,
            address: addressController.value.text,
            area: areaController.value.text,
            gender: selectedGender.value,
            relation: selectedRelation.value,
            mobileNumber: mobileNumberController.value.text,
            whatsappNumber: whatsappNumberController.value.text,
            birthDate: DateTime.parse(dateinput.value.text),
            email: emailController.value.text,
            education: selectedEducation.value,
            maritalStatus: selectedMarital.value,
            occupation: selectedOccupation.value,
            bloodGroup: selectedBloodGroup.value,
            samajId: 0,
            familyMemberId:0,
            isAdmin: false,
            memberId: 0,
            sakhe:'' ,
            village: ''
        )
      );

      if(addNotificationResponse == true){
        isLoading.value = false;
        Fluttertoast.showToast(
            msg: "Member Added SuccessFully Done",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: ThemeService.black,
            fontSize: 16.0);

        selectedFile.value = null;
        selectedGenderId.value ="";
        selectedGender.value ="";

        selectedRelationId.value ="";
        selectedRelation.value="";

        selectedEducation.value="";
        selectedEducationId.value="";

        selectedOccupation.value ="";
        selectedOccupationId.value="";

        selectedBloodGroup.value="";
        selectedBloodGroupId.value="";

        dateinput.value.clear();
        familymemberNameController.value.clear();
        addressController.value.clear();
        areaController.value.clear();
        mobileNumberController.value.clear();
        whatsappNumberController.value.clear();
        emailController.value.clear();

        familyMemberController.familyMemberList.clear();
        familyMemberController.getFamilyMember();

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
