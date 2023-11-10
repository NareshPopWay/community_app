import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/custom_exceptions.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/common/ui.dart';
import 'package:community_app/models/PMemberModel.dart';
import 'package:community_app/models/member_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

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

  static dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw UnauthorisedException(response.body.toString());
      default:
        print('error : ${response.body}');
        Ui.ErrorSnackBar(
          title: 'Something Went Wrong!',
          message: 'Error occured while Communication with Server with StatusCode : ${response.statusCode}. Try Again Later',
        );
        Ui.progressDialog(false);
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}. Try Again Later',
        );
    }
  }
}
