import 'package:community_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberScreen extends GetView<AuthController> {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      body: Text('Member')
    ));
  }
}


