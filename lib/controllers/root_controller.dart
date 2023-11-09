import 'package:get/get.dart';

class RootController extends GetxController {
  RxString userName = "".obs;
  RxString name = "".obs;
  RxString password = "".obs;
  RxString token = "".obs;
  RxList<String> drawer = <String>[].obs;
  @override
  void onInit() async {

    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
