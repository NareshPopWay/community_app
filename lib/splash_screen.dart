import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ThemeService.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: controller.visible.value ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  height: Get.height /3,
                  width: Get.height /3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
