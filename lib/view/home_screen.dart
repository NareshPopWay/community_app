

// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/view/about_us_screen.dart';
import 'package:community_app/view/committee_screen.dart';
import 'package:community_app/view/Member/member_screen.dart';
import 'package:community_app/view/Notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common/api_constant.dart';

class HomeScreen extends GetView<AuthController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          controller.pageTitle.value,
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Builder(
            builder: (context) => GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  "assets/menu.png",
                  height: AppSpacings.s30,
                  alignment: Alignment.center,
                ),
            )),
      ),
      drawer:  SizedBox(
        width: Get.width * 0.60,
        child: Drawer(
          child: Container(
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ThemeService.primaryColor,
                      ThemeService.Scolor,
                    ])),
            child: Column(
              children: [
                SizedBox(
                  height: AppSpacings.s15,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("./assets/logo.png"),
                      )),
                ),
                SizedBox(
                  height: AppSpacings.s15,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(AppSpacings.s10, 0, AppSpacings.s10, 0),
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          controller.token.value = GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
                          log('Token ${controller.token.value}');
                          if(controller.token.value == ''){
                            Get.toNamed(Routes.login);
                          }else{
                            Get.toNamed(Routes.familyMember);
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Family Members',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(FeatherIcons.userPlus, color: Colors.white),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //
                      //   },
                      //   child: ListTile(
                      //     title: Text(
                      //       'Our Committee',
                      //       style: GoogleFonts.aBeeZee(
                      //           color: Colors.white, fontWeight: FontWeight.bold),
                      //     ),
                      //     dense: true,
                      //     leading: const Icon(FeatherIcons.users, color: Colors.white),
                      //   ),
                      // ),
                      // const Divider(
                      //   color: Colors.white,
                      //   height: 0.9,
                      //   thickness: 0.3,
                      //
                      // ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.marriage);
                        },
                        child: ListTile(
                          title: Text(
                            'Marriage',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: Icon(
                            MdiIcons.ring,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,

                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.job);
                        },
                        child: ListTile(
                          title: Text(
                            'Job',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.globe,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,

                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.business);
                        },
                        child: ListTile(
                          title: Text(
                            'Business',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.briefcase,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,

                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.advertisement);
                        },
                        child: ListTile(
                          title: Text(
                            'Advertisement',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.airplay,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,

                      ),
                      // InkWell(
                      //   onTap: () {
                      //
                      //   },
                      //   child: ListTile(
                      //     title: Text(
                      //       'Notification',
                      //       style: GoogleFonts.aBeeZee(
                      //           color: Colors.white, fontWeight: FontWeight.bold),
                      //     ),
                      //     dense: true,
                      //     leading: const Icon(
                      //       FeatherIcons.bell,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // const Divider(
                      //   color: Colors.white,
                      //   height: 0.9,
                      //   thickness: 0.3,
                      //
                      // ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.donation);
                        },
                        child: ListTile(
                          title: Text(
                            'Donation',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.command,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,

                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: ListTile(
                          title: Text(
                            'Request',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.gitPullRequest,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,

                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.marksheet);
                        },
                        child: ListTile(
                          title: Text(
                            'Marksheet',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.map,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.feedBack);
                        },
                        child: ListTile(
                          title: Text(
                            'Feedback',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.star,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //
                      //   },
                      //   child: ListTile(
                      //     title: Text(
                      //       'About Us',
                      //       style: GoogleFonts.aBeeZee(
                      //           color: Colors.white, fontWeight: FontWeight.bold),
                      //     ),
                      //     dense: true,
                      //     leading: const Icon(
                      //       FeatherIcons.shield,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      // const Divider(
                      //   color: Colors.white,
                      //   height: 0.9,
                      //   thickness: 0.3,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            ' Developed and Maintain By ',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: AppSpacings.s10,
                          ),
                          const Image(
                            width: 150,
                            image: AssetImage("./assets/cl.png"),
                          ),
                          SizedBox(
                            height: AppSpacings.s10,
                          ),
                          //Image.asset("./assets/cl.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: controller.selectedIndex.value,
        children:  [
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
                controller.onItemTap(index);
                controller.selectedIndex.value = index;
              },
            ),
          ),
        ),
      ),
    ));
  }
}


