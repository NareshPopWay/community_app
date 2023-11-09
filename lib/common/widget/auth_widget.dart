import 'package:community_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWidget extends GetResponsiveView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.displayWidget.value);
  }
}
