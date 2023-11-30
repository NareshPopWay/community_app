// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MemberController/member_controller.dart';
import 'package:community_app/models/member_model.dart';
import 'package:flutter/cupertino.dart';
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
        // appBar: AppBar(
        //   backgroundColor: ThemeService.primaryColor,
        //   title: Text(
        //     "Member",
        //     style: GoogleFonts.aBeeZee(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20,
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
          Get.toNamed(Routes.addMember);
        },
        child: Icon(MdiIcons.accountPlusOutline, color: Colors.white),
      ),
       body:
      // controller.isLoading.value
      //     ? Center(
      //     child: CircularProgressIndicator(
      //         backgroundColor: Colors.white,
      //         valueColor:
      //         AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
      //     : controller.memberList.isEmpty
      //     ? Center(
      //   child: Text(
      //     'Member\'s Not Available',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w400,
      //       fontSize: AppSpacings.s20,
      //     ),
      //   ),
      // )
      //     :
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(AppSpacings.s20, AppSpacings.s5,
                    AppSpacings.s20, AppSpacings.s20),
                child: Center(
                  child: CupertinoSearchTextField(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ThemeService.grayScale.withOpacity(.7),
                      border: Border.all(color: ThemeService.primaryColor)
                    ),
                   // backgroundColor: ThemeService.grayScale.withOpacity(.7),
                    itemColor: ThemeService.black,
                    placeholder: 'Search Member',
                    controller: controller.searchText.value,
                    placeholderStyle: TextStyle(
                        fontSize: AppSpacings.s18,
                        color: Get.theme.disabledColor),
                    onSuffixTap: () {
                      controller.isMemberSearching.value = false;
                      controller.memberSearchResult.clear();
                      controller.searchText.value.clear();
                      FocusScope.of(context).unfocus();
                    },
                    suffixIcon: Icon(
                      Icons.cancel,
                      size: AppSpacings.s30,
                      color: ThemeService.primaryColor,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        size: AppSpacings.s30,
                        color: ThemeService.primaryColor,
                      ),
                    ),
                    onChanged: (value) {
                      controller.onSearch(value.toString(),
                          searchResult: controller.memberSearchResult,
                          list: controller.memberList,
                          isSearching: controller.isMemberSearching);
                      if(controller.searchText.value.text.isEmpty){
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.isLoading.value ?
                    Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor:
                            AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
                        : controller.memberList.value.isEmpty
                        ? Center(
                      child: Text(
                        'Member\'s Not Available',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSpacings.s22,
                        ),
                      ),
                    )
                        : controller.isMemberSearching.value
                        ? buildListView(controller.memberSearchResult) :
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                          padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
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
                                      padding: const EdgeInsets.only(top: 5.0, left: 10, bottom: 5),
                                      child: Container(
                                        width: Get.height * 0.15,
                                        height: Get.height * 0.15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
    ));
  }

   Widget buildListView(RxList<MemberModel> memberSearchResult) {
     return memberSearchResult.isEmpty
         ?Center(
       child: Text(
         'Member\'s Not Available',
         style: TextStyle(
           color: Colors.black,
           fontWeight: FontWeight.w400,
           fontSize: AppSpacings.s22,
         ),
       ),
     ):Expanded(
       child: ListView.builder(
           shrinkWrap: true,
           physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
           padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
           itemCount: memberSearchResult.length,
           itemBuilder: (context, index) {
             return InkWell(
               onTap: () {
                 Get.toNamed(Routes.memberDetails,arguments:memberSearchResult[index]);
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
                                   memberSearchResult[index].fileData,
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
                                   memberSearchResult[index]
                                       .familyMemberId
                                       .toString() != null
                                       ? memberSearchResult[index]
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
                                       memberSearchResult[index]
                                           .familyMemberName != null
                                           ? memberSearchResult[index]
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
                                       memberSearchResult[index]
                                           .memberId
                                           .toString() !=
                                           null
                                           ? memberSearchResult[index]
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
                                       memberSearchResult[index]
                                           .area !=
                                           null
                                           ? memberSearchResult[index]
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
                                       memberSearchResult[index]
                                           .village !=
                                           null
                                           ? memberSearchResult[index]
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
                                         memberSearchResult[
                                         index]
                                             .mobileNumber !=
                                             null
                                             ? memberSearchResult[
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
     );
   }
}


