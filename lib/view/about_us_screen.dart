import 'package:community_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends GetView<AuthController> {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
        body: Text('AboutUs')
    ));
  }
}


