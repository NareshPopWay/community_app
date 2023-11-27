import 'package:community_app/controllers/NotificationController/good_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoodNewsScreen extends GetView<GoodNewsController> {
  const GoodNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Good News'))
    );
  }
}


