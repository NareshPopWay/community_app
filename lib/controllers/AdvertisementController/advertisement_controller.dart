import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/addvertisement_model.dart';


class AdvertisementController extends GetxController {

  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxString userTypeId="".obs;
  RxList<AdvertisementModel> advertisementList = <AdvertisementModel>[].obs;

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
    getAdvertisement();
  }

  Rx<TextEditingController> searchText = TextEditingController().obs;
  final RxList<AdvertisementModel> advertisementSearchResult = RxList();
  final RxBool isAdvertisementSearching = RxBool(false);

  void onSearch(
      String text, {
        required RxList searchResult,
        required List<AdvertisementModel> list,
        required RxBool isSearching,
      }) async {
    searchResult.clear();
    isSearching.value = text.isNotEmpty;
    if (text.isEmpty) {
      return;
    }
    for (var searchText in list) {
      if ((searchText.memberName.toString().trim()).toLowerCase().contains(text.trim().toLowerCase()) || (searchText.aboutAdvertisement.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.mobileNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.whatsappNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.whatsappNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())) {
        searchResult.add(searchText);
      }
    }
  }


  Future<void> getAdvertisement() async {
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

    var advertisementResponse = await APIProvider().getAdvertisement(token.value);
    if (advertisementResponse.isNotEmpty) {
      advertisementList.addAll(advertisementResponse);
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
