import 'package:community_app/controllers/about_us_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationNewsScreen extends GetView<AboutUsController> {
  const EducationNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Education News Screen'))
    );
  }
}


