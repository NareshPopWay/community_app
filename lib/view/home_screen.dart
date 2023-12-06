

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
                  FocusScope.of(context).unfocus();
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  "assets/menu.png",
                  height: AppSpacings.s30,
                  alignment: Alignment.center,
                ),
            )),
        actions: [
          // GestureDetector(
          //   onTap: (){
          //     controller.token.value = GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
          //     log('Token ${controller.token.value}');
          //     if(controller.token.value == ''){
          //       Get.back();
          //       Get.toNamed(Routes.login);
          //     }
          //     // else{
          //     //   Get.back();
          //     //   Get.toNamed(Routes.familyMember);
          //     // }
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(12),
          //     child: Container(
          //       width: 60,
          //       decoration:  BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //         color: ThemeService.white,
          //         // gradient: LinearGradient(
          //         //   colors: [
          //         //     ThemeService.primaryColor,
          //         //     ThemeService.grayScale,
          //         //   ],
          //         //   begin: const FractionalOffset(0.0, 0.0),
          //         //   end: const FractionalOffset(1.0, 0.0),
          //         //   stops: [0.0, 1.0],
          //         //   tileMode: TileMode.clamp,
          //         // ),
          //       ),
          //       child: Center(
          //         child: Text("Login", style: GoogleFonts.aBeeZee(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
          //       ),
          //     ),
          //   ),
          // ),
        ],
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
                      if(controller.userTypeId.value == '4')
                      InkWell(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.adminLogin);
                        },
                        child: ListTile(
                          title: Text(
                            'Admin Login',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.logIn,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if(controller.userTypeId.value == '4')
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,
                      ),
                      if(controller.userTypeId.value == '4')
                      InkWell(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.login);
                        },
                        child: ListTile(
                          title: Text(
                            'Member Login',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.logIn,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if(controller.userTypeId.value == '4')
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,
                      ),
                      InkWell(
                        onTap: () {
                          // controller.token.value = GetStorage().read(BaseUrl.LoginAuthorizetoken).toString();
                          // log('Token ${controller.token.value}');
                          // if(controller.token.value == ''){
                          //   Get.back();
                          //   Get.toNamed(Routes.login);
                          // }else{
                            Get.back();
                            Get.toNamed(Routes.familyMember);
                          // }
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
                          Get.back();
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
                          Get.back();
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
                          Get.back();
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
                          Get.back();
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
                          Get.back();
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
                          Get.back();
                          Get.toNamed(Routes.request);
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
                          Get.back();
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
                          Get.back();
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
                      if(controller.userTypeId.value == '1' ||controller.userTypeId.value == '2')
                      InkWell(
                        onTap: () async{
                          // await GetStorage().write(BaseUrl.Authorizetoken,"null");
                          // await GetStorage().write(BaseUrl.UserTypeID,"4");
                          controller.getToken();
                          controller.token.value = GetStorage().read(BaseUrl.Authorizetoken).toString();
                          Get.back();
                        },
                        child: ListTile(
                          title: Text(
                            'Logout',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                          leading: const Icon(
                            FeatherIcons.logOut,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if(controller.token.value != '')
                      const Divider(
                        color: Colors.white,
                        height: 0.9,
                        thickness: 0.3,
                      ),
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
             AboutUsScreen(),
             MemberScreen(),
             CommitteeScreen(),
             NotificationScreen(),
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
                  icon: FeatherIcons.shield,
                  text: 'Home',
                ),
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


