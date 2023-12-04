import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/constant.dart';
import 'package:community_app/common/custom_exceptions.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/common/ui.dart';
import 'package:community_app/models/PMemberModel.dart';
import 'package:community_app/models/family_member_model.dart';
import 'package:community_app/models/field_item_value_model.dart';
import 'package:community_app/models/marriage_model.dart';
import 'package:community_app/models/member_model.dart';
import 'package:community_app/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/addvertisement_model.dart';
import '../models/business_model.dart';
import '../models/feedback_model.dart';
import '../models/job_model.dart';
import '../models/marksheet_model.dart';

class APIProvider {

  Future<bool> getToken() async {
    var responseJson;
    String token = "";
    try {
      log(BaseUrl.login);
      final response = await http.post(
        Uri.parse(BaseUrl.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "SamajID": 1,
          "userTypeId": 4,
          "Username": "Visitor",
          "Password": "Visitor",
        }),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body);
        responseJson = json.decode(response.body);

        token = responseJson['token'].toString();
        int STC = 1;
        GetStorage().write(BaseUrl.Authorizetoken, token);
        GetStorage().write('STC', STC.toString());
        print(token);
        return true;

      } else {
        return false;
      }
    } catch (e) {
      print("error.... getToken ...$e");
    }
    return false;
  }

  Future<List<MemberModel>> getMember(String apiToken) async {
    var responseJson;
    List<MemberModel> list = [];
    try {
      log(BaseUrl.GetMember);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetMember,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson['value'].length; i++) {
        list.add(MemberModel.fromJson(responseJson['value'][i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getMember ...... $e");
    }
    return list;
  }

  Future createMember(PMember members) async {
    bool isInternet = await Constants.isInternetAvail();
    if (!isInternet) {
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
    String token = GetStorage().read(BaseUrl.Authorizetoken).toString();
    final response = await http.post(
      Uri.parse(BaseUrl.AddMember),
      headers: <String, String>{
        "Content-Type": "application/json", "Authorization": "Bearer $token"
      },
      body: jsonEncode(members.toJson()),
    );
    var responseStr = response.body.toString();
    log(responseStr);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      //final data = PMember.fromJson(json.decode(response.body));
      Fluttertoast.showToast(
          msg: "Member Register SuccessFully..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: ThemeService.black,
          fontSize: 16.0);
    } else {
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


  Future<List<NotificationModel>> getGoodNews(String apiToken) async {
    var responseJson;
    List<NotificationModel> list = [];
    try {
      log(BaseUrl.GetGoodNews);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetGoodNews,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson.length; i++) {
        list.add(NotificationModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getGoodNews ...... $e");
    }
    return list;
  }

  Future<List<NotificationModel>> getSadNews(String apiToken) async {
    var responseJson;
    List<NotificationModel> list = [];
    try {
      log(BaseUrl.GetSadNews);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetSadNews,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson.length; i++) {
        list.add(NotificationModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getSadNews ...... $e");
    }
    return list;
  }

  Future<List<NotificationModel>> getEduNews(String apiToken) async {
    var responseJson;
    List<NotificationModel> list = [];
    try {
      log(BaseUrl.GetEducationNews);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetEducationNews,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson.length; i++) {
        list.add(NotificationModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...GetEducationNews ...... $e");
    }
    return list;
  }

  Future<List<NotificationModel>> getGovNews(String apiToken) async {
    var responseJson;
    List<NotificationModel> list = [];
    try {
      log(BaseUrl.GetGovNews);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetGovNews,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson.length; i++) {
        list.add(NotificationModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...GetGovNews ...... $e");
    }
    return list;
  }

  Future<List<NotificationModel>> getOtherNews(String apiToken) async {
    var responseJson;
    List<NotificationModel> list = [];
    try {
      log(BaseUrl.GetOtherNews);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetOtherNews,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson.length; i++) {
        list.add(NotificationModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...GetOtherNews ...... $e");
    }
    return list;
  }


  Future<List<FieldItemValueModel>> getAllType() async {
    var responseJson;
    List<FieldItemValueModel> list = [];
    try {
      log(BaseUrl.NotificationType);

      final response = await http.get(
          Uri.parse(
            BaseUrl.NotificationType,
          ),
          headers: {
            "Content-Type": "application/json",
          });
      responseJson = json.decode(response.body);
      log(response.body);
      for (int i = 0; i < responseJson.length; i++) {
        list.add(FieldItemValueModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getAllType ...... $e");
    }
    return list;
  }

  Future<bool> addNotification({
    required String apiToken,
    required String aboutNotification,
    required String notificationType,
    required String fileData
  }) async{

    try{

      Map body= {
        "aboutNotification": aboutNotification,
        "notificationType": int.parse(notificationType),
        "fileData": fileData,
      };
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddNotification),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body: jsonEncode(
            {
              "aboutNotification": aboutNotification,
              "notificationType": int.parse(notificationType),
              "fileData": fileData,
            }
        ),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }

  Future<String> saveImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveNotificationImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }

  Future<List<FamilyMemberModel>> getFamilyMember(String apiToken) async {
    var responseJson;
    List<FamilyMemberModel> list = [];
    try {
      log(BaseUrl.GetFamilyMember);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetFamilyMember,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      responseJson = json.decode(response.body);
      log(response.body);

      for (int i = 0; i < responseJson.length; i++) {
        list.add(FamilyMemberModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getFamilyMember ...... $e");
    }
    return list;
  }

  Future<List<MarriageModel>> getMarriage(String apiToken) async {
    var responseJson;
    List<MarriageModel> list = [];
    try {
      log(BaseUrl.GetMarriage);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetMarriage,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      log('getMarriage - ${response.body}');
      responseJson = json.decode(response.body);
      log(response.statusCode.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(MarriageModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getFamilyMember ...... $e");
    }
    return list;
  }

  Future<bool> login({
    required String Username,
    required String Password,
  }) async{
   var responseJson;
   String token = "";
    try{
      Map body= {
        "SamajID": 1,
        "userTypeId": 2,
        "Username": Username,
        "Password": Password,
      };
      log(BaseUrl.login);
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.login),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body:jsonEncode(
            {
              "SamajID": 1,
              "userTypeId": 2,
              "Username": Username,
              "Password": Password,
            }
        )

      );
      log('RESPONSE BODY: ${response.body}');
      responseJson = jsonDecode(response.body);
      if (response.statusCode == 200) {
        token = responseJson['token'].toString();
        GetStorage().write(BaseUrl.LoginAuthorizetoken, token);
        return true;
      }else{
        Fluttertoast.showToast(
            msg: responseJson['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: ThemeService.white,
            fontSize: 16.0);
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }

  Future<bool> addFamilyMember(
      {required FamilyMemberModel members, required String apiToken}) async{

    try{
      Map body= members.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddFamilyMember),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(members.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }

  Future<String> saveFamilyMemberImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveFamilyMemberImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }


  Future<String> saveMarriageImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveMarriageImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }

  Future<bool> marriageRegistration(
      {required MarriageModel marriageDetails, required String apiToken}) async{

    try{
      Map body= marriageDetails.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddMarriage),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(marriageDetails.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }


  Future<List<JobModel>> getJob(String apiToken) async {
    var responseJson;
    List<JobModel> list = [];
    try {
      log(BaseUrl.GetJob);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetJob,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      log('getJob - ${response.body}');
      responseJson = json.decode(response.body);
      log(response.statusCode.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(JobModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getFamilyMember ...... $e");
    }
    return list;
  }

  Future<String> saveJobImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveJobImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }

  Future<bool> addJob(
      {required JobModel jobDetails, required String apiToken}) async{

    try{
      Map body= jobDetails.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddJob),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(jobDetails.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }


  Future<List<BusinessModel>> GetBusiness(String apiToken) async {
    var responseJson;
    List<BusinessModel> list = [];
    try {
      log(BaseUrl.GetBusiness);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetBusiness,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      log('GetBusiness - ${response.body}');
      responseJson = json.decode(response.body);
      log(response.statusCode.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(BusinessModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getFamilyMember ...... $e");
    }
    return list;
  }

  Future<String> saveBusinessImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveBusinessImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }

  Future<bool> addBusiness(
      {required BusinessModel businessDetails, required String apiToken}) async{

    try{
      Map body= businessDetails.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddBusiness),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(businessDetails.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }



  Future<List<AdvertisementModel>> getAdvertisement(String apiToken) async {
    var responseJson;
    List<AdvertisementModel> list = [];
    try {
      log(BaseUrl.GetAdvertisement);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetAdvertisement,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      log('getAdvertisement - ${response.body}');
      responseJson = json.decode(response.body);
      log(response.statusCode.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(AdvertisementModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getFamilyMember ...... $e");
    }
    return list;
  }

  Future<String> saveAdvertisementImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveAdvertisementImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }

  Future<bool> addAdvertisement(
      {required AdvertisementModel advertisementDetails, required String apiToken}) async{

    try{
      Map body= advertisementDetails.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddAdvertisement),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(advertisementDetails.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }


  Future<List<MarksheetModel>> getMarksheet(String apiToken) async {
    var responseJson;
    List<MarksheetModel> list = [];
    try {
      log(BaseUrl.GetMarkSheet);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetMarkSheet,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      log('getMarksheet - ${response.body}');
      responseJson = json.decode(response.body);
      log(response.statusCode.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(MarksheetModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getMarksheet ...... $e");
    }
    return list;
  }

  Future<String> saveMarksheetImage({required String apiToken,required String imageFile}) async{
    var responseJson = '';

    var request = http.MultipartRequest(
        "POST", Uri.parse(BaseUrl.SaveMarkSheetImage));
    request.headers.addAll({
      "Authorization": "Bearer $apiToken"
    });
    request.files.add(await http.MultipartFile.fromPath('imageFile', imageFile));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      responseJson = await response.stream.bytesToString();
      log('RESPONSE BODY: ${responseJson}');
      return responseJson.toString();
    }
    return responseJson.toString();
  }

  Future<bool> addMarksheet(
      {required MarksheetModel markSheetDetails, required String apiToken}) async{

    try{
      Map body= markSheetDetails.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddMarkSheet),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(markSheetDetails.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }


  Future<List<FeedbackModel>> getFeedBack(String apiToken) async {
    var responseJson;
    List<FeedbackModel> list = [];
    try {
      log(BaseUrl.GetFeedback);

      final response = await http.get(
          Uri.parse(
            BaseUrl.GetFeedback,
          ),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $apiToken",
          });
      log('getFeedBack - ${response.body}');
      responseJson = json.decode(response.body);
      log(response.statusCode.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(FeedbackModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getFeedBack ...... $e");
    }
    return list;
  }

  Future<bool> addFeedBack(
      {required FeedbackModel feedbackDetails, required String apiToken}) async{

    try{
      Map body= feedbackDetails.toJson();
      log('$body');
      final response = await http.post(
        Uri.parse(BaseUrl.AddFeedback),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiToken"
        },
        body:jsonEncode(feedbackDetails.toJson()),
      );
      log('RESPONSE BODY: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      }else{
        return false;
      }
    }catch (e) {
      debugPrint("Error $e");
    }
    return false;
  }

}


