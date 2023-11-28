import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/api_provider.dart';
import '../../models/field_item_value_model.dart';

class AddNotificationController extends GetxController {

  final key = new GlobalKey<FormState>();
  Rx<String> selectedValue = ''.obs;
  Rx<String> aboutNotification = ''.obs;



  Rx<TextEditingController> AboutNotificationController = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    NotificationItemList.value = await APIProvider().getAllType();
  }

  RxString selectedNotificationItem = "".obs;
  RxString selectedNotificationItemId = "".obs;
  RxBool isNotificationItemExpanded = false.obs;
  RxList<FieldItemValueModel> NotificationItemList = <FieldItemValueModel>[].obs;

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
}
