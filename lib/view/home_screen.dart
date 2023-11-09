

import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/view/about_us_screen.dart';
import 'package:community_app/view/committee_screen.dart';
import 'package:community_app/view/member_screen.dart';
import 'package:community_app/view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends GetView<AuthController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      body: IndexedStack(
        index: controller.selectedIndex.value,
        children: const [
             MemberScreen(),
             CommitteeScreen(),
             NotificationScreen(),
             AboutUsScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ThemeService.primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              textSize: 5.5,
              padding:  EdgeInsets.symmetric(horizontal: AppSpacings.s12, vertical: AppSpacings.s15),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              style: GnavStyle.google,
              color: Colors.black,
              textStyle: Get.textTheme.headline1!.copyWith(
                color: ThemeService.black,
                fontSize: AppSpacings.s20,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                GButton(
                  icon: FeatherIcons.userCheck,
                  text: 'Member',
                ),
                GButton(
                  icon: FeatherIcons.users,
                  text: 'Committee',
                ),
                GButton(
                  icon: FeatherIcons.bell,
                  text: 'Notification',
                ),
                GButton(
                  icon: FeatherIcons.shield,
                  text: 'AboutUs',
                ),
              ],
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) {
                controller.selectedIndex.value = index;
              },
            ),
          ),
        ),
      ),
    ));
  }
}


