import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/business_model.dart';
import '../../models/job_model.dart';

class BusinessController extends GetxController {

  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxString userTypeId="".obs;
  RxList<BusinessModel> businessList = <BusinessModel>[].obs;

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
    getBusiness();
  }

  Rx<TextEditingController> searchText = TextEditingController().obs;
  final RxList<BusinessModel> businessSearchResult = RxList();
  final RxBool isBusinessSearching = RxBool(false);

  void onSearch(
      String text, {
        required RxList searchResult,
        required List<BusinessModel> list,
        required RxBool isSearching,
      }) async {
    searchResult.clear();
    isSearching.value = text.isNotEmpty;
    if (text.isEmpty) {
      return;
    }
    for (var searchText in list) {
      if ((searchText.samajId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase()) || (searchText.memberId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.mobileNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.memberName.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.village.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())) {
        searchResult.add(searchText);
      }
    }
  }


  Future<void> getBusiness() async {
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

    var businessResponse = await APIProvider().GetBusiness(token.value);
    if (businessResponse.isNotEmpty) {
      businessList.addAll(businessResponse);
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
