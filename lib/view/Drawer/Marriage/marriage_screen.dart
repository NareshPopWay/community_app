// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MarriageController/marriage_controller.dart';
import 'package:community_app/models/marriage_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../common/api_constant.dart';
import '../../../common/routes/app_routes.dart';
import '../../../common/spacing.dart';
import '../../../controllers/FamilyMemberController/family_member_controller.dart';

class MarriageScreen extends GetView<MarriageController> {
  const MarriageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Marriage",
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
            )
        ),
      ),
      floatingActionButton:controller.userTypeId.value == "1" ? FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
          Get.toNamed(Routes.addMarriage);
        },
        child: Icon(MdiIcons.notebookPlus, color: Colors.white),
      ):Container(),
      body: Column(
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
                placeholder: 'Search here...',
                controller: controller.searchText.value,
                placeholderStyle: TextStyle(
                    fontSize: AppSpacings.s18,
                    color: Get.theme.disabledColor),
                onSuffixTap: () {
                  controller.isMarriageSearching.value = false;
                  controller.marriageSearchResult.clear();
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
                      searchResult: controller.marriageSearchResult,
                      list: controller.marriageList,
                      isSearching: controller.isMarriageSearching);
                  if(controller.searchText.value.text.isEmpty){
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),
          ),
          Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.isLoading.value ?
                Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
                    : controller.marriageList.value.isEmpty
                    ? Center(
                  child: Text(
                    'Marriage\'s Not Available',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSpacings.s22,
                    ),
                  ),
                )
                    : controller.isMarriageSearching.value
                    ? buildListView(controller.marriageSearchResult)
                    :Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
                      itemCount: controller.marriageList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.marriageDetail,arguments:controller.marriageList[index]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                            elevation: 5.5, // Change this
                            //shadowColor: ThemeService.primaryColor,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: Get.height * 0.15,
                                        height: Get.height * 0.15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              BaseUrl.ImageURL +
                                                  controller.marriageList[index]
                                                      .fileData,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              controller.marriageList[index]
                                                  .name !=
                                                  null
                                                  ? controller.marriageList[index]
                                                  .name
                                                  : '',
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 18.0,
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
                                              "DOB : ",
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700),
                                              textAlign:
                                              TextAlign.start,
                                            ),
                                            Text(
                                              DateFormat('dd/MM/yyyy').format(controller.marriageList[index]
                                                  .birthDate) !=
                                                  null
                                                  ? DateFormat('dd/MM/yyyy').format(controller.marriageList[index]
                                                  .birthDate)
                                                  : '',
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
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
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700),
                                              textAlign:
                                              TextAlign.start,
                                            ),
                                            Text(
                                              controller.marriageList[index]
                                                  .village !=
                                                  null
                                                  ? controller.marriageList[index]
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
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Mobile No. : ",
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
                                                controller.marriageList[index]
                                                    .mobileNumber !=
                                                    null
                                                    ? controller.marriageList[index]
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
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Education : ",
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700),
                                              textAlign:
                                              TextAlign.start,
                                            ),
                                            Text(
                                              controller.marriageList[index]
                                                  .qualification !=
                                                  null
                                                  ? controller.marriageList[index]
                                                  .qualification
                                                  : '',
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
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
                                              "Occupation : ",
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700),
                                              textAlign:
                                              TextAlign.start,
                                            ),
                                            Text(
                                              controller.marriageList[index]
                                                  .occupation !=
                                                  null
                                                  ? controller.marriageList[index]
                                                  .occupation
                                                  : '',
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w400),
                                              textAlign:
                                              TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(
                                  height: Get.height*0.01,
                                ),
                                Divider(
                                  height: 2,
                                  color: ThemeService.Scolor,
                                  indent: 15,
                                  endIndent: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        controller.marriageList[index]
                                            .marriageId.toString() !=
                                            null
                                            ? controller.marriageList[index]
                                            .marriageId.toString()
                                            : '',
                                        overflow: TextOverflow
                                            .ellipsis,
                                        maxLines: 2,
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 30.0,
                                            color: ThemeService.Scolor,
                                            fontWeight:
                                            FontWeight
                                                .w900),
                                        textAlign:
                                        TextAlign.start,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Share.share(
                                        //   'https://www.84skpsurat.com/marriage_details.php?id=' +
                                        //       filteredUsers[index].id +
                                        //       '\n Membername : ' +
                                        //       filteredUsers[index].fullname,
                                        // );
                                      },
                                      icon: Icon(FeatherIcons.share2,
                                          color: ThemeService.primaryColor),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }

  Widget buildListView(RxList<MarriageModel> marriageSearchResult) {
    return marriageSearchResult.isEmpty
        ?Center(
      child: Text(
        'Marriage\'s Not Available',
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
          padding: EdgeInsets.fromLTRB  (0, AppSpacings.s15,0, 0),
          itemCount: marriageSearchResult.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.marriageDetail,arguments:marriageSearchResult[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                elevation: 5.5,
                //shadowColor: ThemeService.primaryColor,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Get.height * 0.15,
                            height: Get.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  BaseUrl.ImageURL +
                                     marriageSearchResult[index]
                                          .fileData,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  marriageSearchResult[index]
                                      .name !=
                                      null
                                      ? marriageSearchResult[index]
                                      .name
                                      : '',
                                  overflow: TextOverflow
                                      .ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 18.0,
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
                                  "DOB : ",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
                                      fontWeight:
                                      FontWeight
                                          .w700),
                                  textAlign:
                                  TextAlign.start,
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy').format(marriageSearchResult[index]
                                      .birthDate) !=
                                      null
                                      ? DateFormat('dd/MM/yyyy').format(marriageSearchResult[index]
                                      .birthDate)
                                      : '',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
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
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
                                      fontWeight:
                                      FontWeight
                                          .w700),
                                  textAlign:
                                  TextAlign.start,
                                ),
                                Text(
                                  marriageSearchResult[index]
                                      .village !=
                                      null
                                      ? marriageSearchResult[index]
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
                              ],
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Mobile No. : ",
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
                                    marriageSearchResult[index]
                                        .mobileNumber !=
                                        null
                                        ? marriageSearchResult[index]
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
                              height: 2.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Education : ",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
                                      fontWeight:
                                      FontWeight
                                          .w700),
                                  textAlign:
                                  TextAlign.start,
                                ),
                                Text(
                                  marriageSearchResult[index]
                                      .qualification !=
                                      null
                                      ? marriageSearchResult[index]
                                      .qualification
                                      : '',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
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
                                  "Occupation : ",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
                                      fontWeight:
                                      FontWeight
                                          .w700),
                                  textAlign:
                                  TextAlign.start,
                                ),
                                Text(
                                  marriageSearchResult[index]
                                      .occupation !=
                                      null
                                      ? marriageSearchResult[index]
                                      .occupation
                                      : '',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15.0,
                                      fontWeight:
                                      FontWeight
                                          .w400),
                                  textAlign:
                                  TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        )

                      ],
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    Divider(
                      height: 2,
                      color: ThemeService.Scolor,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            marriageSearchResult[index]
                                .marriageId.toString() !=
                                null
                                ? marriageSearchResult[index]
                                .marriageId.toString()
                                : '',
                            overflow: TextOverflow
                                .ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 30.0,
                                color: ThemeService.Scolor,
                                fontWeight:
                                FontWeight
                                    .w900),
                            textAlign:
                            TextAlign.start,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Share.share(
                            //   'https://www.84skpsurat.com/marriage_details.php?id=' +
                            //       filteredUsers[index].id +
                            //       '\n Membername : ' +
                            //       filteredUsers[index].fullname,
                            // );
                          },
                          icon: Icon(FeatherIcons.share2,
                              color: ThemeService.primaryColor),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

}


