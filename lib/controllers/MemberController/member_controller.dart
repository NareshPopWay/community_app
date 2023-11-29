import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/models/member_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MemberController extends GetxController {


  RxBool isLoading = false.obs;
  RxString token="".obs;
  RxList<MemberModel> memberList = <MemberModel>[].obs;

  final key = new GlobalKey<FormState>();

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
    token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
    if (token.value == "") {
      token.value =   GetStorage().read(BaseUrl.Authorizetoken).toString();
    }

    getMember();
  }


  Future<void> getMember() async {
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

    var memberResponse = await APIProvider().getMember(token.value);
    if (memberResponse.isNotEmpty) {
      memberList.addAll(memberResponse);
      isLoading.value = false;
    } else {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong..",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.SNACKBAR,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.amberAccent,
      //     textColor: Colors.black,
      //     fontSize: 16.0);
      isLoading.value = false;
    }
  }

  Rx<TextEditingController> searchText = TextEditingController().obs;
    final RxList<MemberModel> memberSearchResult = RxList();
  final RxBool isMemberSearching = RxBool(false);

  void onSearch(
      String text, {
        required RxList searchResult,
        required List<MemberModel> list,
        required RxBool isSearching,
      }) async {
    searchResult.clear();
    isSearching.value = text.isNotEmpty;
    if (text.isEmpty) {
      return;
    }
    for (var searchText in list) {
      if ((searchText.samajId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase()) || (searchText.memberId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.familyMemberId.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.familyMemberName.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.address.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.birthDate.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.mobileNumber.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())||(searchText.sakhe.toString().trim()).toLowerCase().contains(text.trim().toLowerCase())) {
        searchResult.add(searchText);
      }
    }
  }

}
