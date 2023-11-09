import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/committee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommitteeScreen extends GetView<ComumitteeController> {
  const CommitteeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
        body: Text('Committee')
    ));
  }
}


