// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../common/api_constant.dart';
import '../../../controllers/FamilyMemberController/family_member_controller.dart';

class FamilyMemberScreen extends GetView<FamilyMemberController> {
  const FamilyMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Family Member",
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: ThemeService.white,
            ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: ()async{
              await GetStorage().write(BaseUrl.LoginAuthorizetoken,"");
              Get.back();
            },
            icon: const Icon(FeatherIcons.logOut,color: ThemeService.white),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
         Get.toNamed(Routes.addFamilyMember);
        },
        child: Icon(MdiIcons.accountPlusOutline, color: Colors.white),
      ),
      body: controller.isLoading.value ?
      Center(
          child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
              AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
          :controller.familyMemberList.value.isEmpty
          ? Center(
        child: Text(
          'Family Member\'s Not Available',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: AppSpacings.s22,
          ),
        ),
      ):ListView.builder(
          itemCount: controller.familyMemberList.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (BuildContext context) =>
              //           MemberDetail(snapshot.data![index])));
              // },
              child:  Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 7, // Change this
                shadowColor: ThemeService.primaryColor,
                child:
                // Padding(
                // padding: const EdgeInsets.only(
                //     top: 3.0, left: 3.0, bottom: 3.0),
                // child:
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:5.0,left:5,bottom:5),
                      child: Container(
                        width: Get.height * 0.18,
                        height: Get.height * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              BaseUrl.ImageURL +
                                  controller.familyMemberList[index]
                                      .fileData,
                            ),
                            // image: AssetImage(
                            //   "./assets/logo.png",
                            // ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:8.0,
                                left: 8.0, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        controller.familyMemberList[index]
                                            .familyMemberName != null
                                            ? controller.familyMemberList[index]
                                            .familyMemberName
                                            : '',
                                        overflow: TextOverflow
                                            .ellipsis,
                                        maxLines: 2,
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 15.0,
                                            fontWeight:
                                            FontWeight
                                                .w700),
                                        textAlign:
                                        TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Relation : ",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    Flexible(
                                      child: Text(
                                        controller.familyMemberList[index]
                                            .relation !=
                                            null
                                            ? controller.familyMemberList[index]
                                            .relation
                                            : '',
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 15.0,
                                            fontWeight:
                                            FontWeight
                                                .w400),
                                        textAlign:
                                        TextAlign.start,
                                      ),
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
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    Flexible(
                                      child: Text(
                                        controller.familyMemberList[index]
                                            .area !=
                                            null
                                            ? controller.familyMemberList[index]
                                            .area
                                            : '',
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 15.0,
                                            fontWeight:
                                            FontWeight
                                                .w400),
                                        textAlign:
                                        TextAlign.start,
                                      ),
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
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    Flexible(
                                      child: Text(
                                        controller.familyMemberList[index]
                                            .village !=
                                            null
                                            ? controller.familyMemberList[index]
                                            .village
                                            : '',
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 15.0,
                                            fontWeight:
                                            FontWeight
                                                .w400),
                                        textAlign:
                                        TextAlign.start,
                                      ),
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
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 15.0,
                                          fontWeight:
                                          FontWeight
                                              .w700),
                                      textAlign:
                                      TextAlign.start,
                                    ),
                                    InkWell(
                                      child: Text(
                                        controller.familyMemberList[index]
                                            .mobileNumber !=
                                            null
                                            ? controller.familyMemberList[index]
                                            .mobileNumber
                                            : '',
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 15.0,
                                            fontWeight:
                                            FontWeight
                                                .w400),
                                        textAlign:
                                        TextAlign.start,
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
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: Get.width/10,
                                        height: Get.height/20,
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(100),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  ThemeService.primaryColor,
                                                  ThemeService.Scolor
                                                ])
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // Navigator.of(ctx).push(
                                            // MaterialPageRoute(
                                            //     builder: (ctx) =>
                                            //         EditMember(snapshot.data![index],
                                            //             FamilyMember_Manager(LoginAuthorizetoken!).findall())
                                            // ));
                                          },
                                          icon: Icon(Icons.edit,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        width: Get.width/10,
                                        height: Get.height/20,
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(100),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  ThemeService.primaryColor,
                                                  ThemeService.Scolor
                                                ])
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // dialogDelete(controller.familyMemberList[index].familyMemberId.toString());
                                          },
                                          icon: Icon(Icons.delete,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
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


