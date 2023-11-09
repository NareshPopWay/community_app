import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/custom_exceptions.dart';
import 'package:community_app/common/ui.dart';
import 'package:community_app/models/member_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIProvider {

  Future<bool> getToken() async {
    var responseJson;
    String token = "";
    try {
      log(BaseUrl.login);
      final response = await http.post(
        Uri.parse(
          BaseUrl.login,
        ),
        body: jsonEncode({
          "SamajID": 1,
          "userTypeId": 4,
          "Username": "Visitor",
          "Password": "Visitor",
        }),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );
      responseJson = _response(response);

      if (response.statusCode == 200) {

        token = responseJson['token'].toString();
        int STC = 1;
        GetStorage().write(BaseUrl.Authorizetoken, token);
        GetStorage().write('STC', STC);
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
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $apiToken',
          });
      responseJson = _response(response);
      log(responseJson.length.toString());

      for (int i = 0; i < responseJson.length; i++) {
        list.add(MemberModel.fromJson(responseJson[i]));
      }
    } on SocketException {
      Ui.ErrorSnackBar(title: 'No Internet connection');
    } catch (e) {
      print("error ...getMember ...... $e");
    }
    return list;
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
