import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/models/marksheet_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/job_model.dart';

class MarksheetController extends GetxController {

  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxList<MarksheetModel> marksheetList = <MarksheetModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }
    getMarksheet();
  }

  Rx<TextEditingController> searchText = TextEditingController().obs;
  final RxList<MarksheetModel> marksheetSearchResult = RxList();
  final RxBool isMarksheetSearching = RxBool(false);

  void onSearch(
      String text, {
        required RxList searchResult,
        required List<MarksheetModel> list,
        required RxBool isSearching,
      }) async {
    searchResult.clear();
    isSearching.value = text.isNotEmpty;
    if (text.isEmpty) {
      return;
    }
    for (var searchText in list) {
      if ((searchText.samajId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase()) || (searchText.memberId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.mobileNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.studentName.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.qualification.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.mediumType.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())) {
        searchResult.add(searchText);
      }
    }
  }


  Future<void> getMarksheet() async {
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

    var marksheetResponse = await APIProvider().getMarksheet(token.value);
    if (marksheetResponse.isNotEmpty) {
      marksheetList.addAll(marksheetResponse);
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
