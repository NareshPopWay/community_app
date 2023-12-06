import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/models/marriage_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MarriageController extends GetxController {

  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxString userTypeId="".obs;
  RxList<MarriageModel> marriageList = <MarriageModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
    userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    if (userTypeId.value == "") {
      userTypeId.value = GetStorage().read(BaseUrl.UserTypeID).toString();
    }
    getMarriage();
  }



  Rx<TextEditingController> searchText = TextEditingController().obs;
  final RxList<MarriageModel> marriageSearchResult = RxList();
  final RxBool isMarriageSearching = RxBool(false);

  void onSearch(
      String text, {
        required RxList searchResult,
        required List<MarriageModel> list,
        required RxBool isSearching,
      }) async {
    searchResult.clear();
    isSearching.value = text.isNotEmpty;
    if (text.isEmpty) {
      return;
    }
    for (var searchText in list) {
      if ((searchText.samajId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase()) || (searchText.memberId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.address.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.birthDate.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.mobileNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.sakhe.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.name.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.maritalStatus.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.occupation.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.qualification.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.village.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.monthlyIncome.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.fatherName.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())) {
        searchResult.add(searchText);
      }
    }
  }


  Future<void> getMarriage() async {
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

    var marriageResponse = await APIProvider().getMarriage(token.value);
    if (marriageResponse.isNotEmpty) {
      marriageList.addAll(marriageResponse);
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
