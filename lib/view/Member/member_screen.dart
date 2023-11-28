// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MemberController/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MemberScreen extends GetView<MemberController> {
   MemberScreen({Key? key}) : super(key: key);

   MemberController controller = Get.put(MemberController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Member",
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //     new MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
              },
              icon: Icon(FeatherIcons.search),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
          Get.toNamed(Routes.addMember);
        },
        child: Icon(MdiIcons.accountPlusOutline, color: Colors.white),
      ),
      body: controller.isLoading.value
          ? Center(
          child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
              AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
          : controller.memberList.isEmpty
          ? Center(
        child: Text(
          'Member\'s Not Available',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: AppSpacings.s20,
          ),
        ),
      )
          : ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.fromLTRB  (0, AppSpacings.s20,0, 0),
          itemCount: controller.memberList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.memberDetails,arguments:controller.memberList[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                elevation: 5.5, // Change this
                // shadowColor: ThemeService.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, bottom: 5),
                      child: Container(
                        width: Get.height * 0.15,
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              BaseUrl.ImageURL +
                                  controller.memberList[index].fileData,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  controller.memberList[index]
                                      .familyMemberId
                                      .toString() != null
                                      ? controller.memberList[index]
                                      .familyMemberId
                                      .toString()
                                      : '',
                                  style:
                                  GoogleFonts.aBeeZee(
                                    color: ThemeService.black,
                                    fontWeight:
                                    FontWeight.w900,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                      controller.memberList[index]
                                          .familyMemberName != null
                                          ? controller.memberList[index]
                                          .familyMemberName
                                          : '',
                                      overflow:
                                      TextOverflow
                                          .ellipsis,
                                      maxLines: 5,
                                      style: GoogleFonts
                                          .aBeeZee(
                                          color:
                                          ThemeService.grayScalecon,
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Member Id : ",
                                      style: GoogleFonts
                                          .aBeeZee(
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    Text(
                                      controller.memberList[index]
                                          .memberId
                                          .toString() !=
                                          null
                                          ? controller.memberList[index]
                                          .memberId
                                          .toString()
                                          : '',
                                      style: GoogleFonts
                                          .aBeeZee(
                                          color:
                                          ThemeService.grayScalecon,
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w400),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Area : ",
                                      style: GoogleFonts
                                          .aBeeZee(
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    Text(
                                      controller.memberList[index]
                                          .area !=
                                          null
                                          ? controller.memberList[index]
                                          .area
                                          : '',
                                      style: GoogleFonts
                                          .aBeeZee(
                                          color:
                                          ThemeService.grayScalecon,
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w400),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Village : ",
                                      style: GoogleFonts
                                          .aBeeZee(
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    Text(
                                      controller.memberList[index]
                                          .village !=
                                          null
                                          ? controller.memberList[index]
                                          .village
                                          : '',
                                      style: GoogleFonts
                                          .aBeeZee(
                                          color:
                                          ThemeService.grayScalecon,
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w400),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Mobile : ",
                                      style: GoogleFonts
                                          .aBeeZee(
                                          fontSize:
                                          15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    InkWell(
                                      child: Text(
                                        controller.memberList[
                                        index]
                                            .mobileNumber !=
                                            null
                                            ? controller.memberList[
                                        index]
                                            .mobileNumber
                                            : '',
                                        style: GoogleFonts.aBeeZee(
                                            color: ThemeService.grayScalecon,
                                            fontSize:
                                            15.0,
                                            fontWeight:
                                            FontWeight
                                                .w400),
                                        textAlign:
                                        TextAlign
                                            .start,
                                      ),
                                      // onTap: () async {
                                      //   var url =
                                      //       'tel:${filteredUsers[index].mobilenumber}';
                                      //   if (await canLaunch(url) != null) {
                                      //     await launch(url);
                                      //   } else {
                                      //     throw 'Could not launch $url';
                                      //   }
                                      // },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // ),
              ),
            );
          }),
    ));
  }
}


