// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../controllers/JobController/job_controller.dart';
import '../../../models/job_model.dart';

class JobScreen extends GetView<JobController> {
  JobScreen({Key? key}) : super(key: key);

  JobController controller = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Job",
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

      ),
      floatingActionButton: controller.userTypeId.value == "1" ?FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
          Get.toNamed(Routes.addJob);
        },
        child: Icon(MdiIcons.notebookPlus, color: Colors.white),
      ):Container(),
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
                placeholder: 'Search Job',
                controller: controller.searchText.value,
                placeholderStyle: TextStyle(
                    fontSize: AppSpacings.s18,
                    color: Get.theme.disabledColor),
                onSuffixTap: () {
                  controller.isJobSearching.value = false;
                  controller.jobSearchResult.clear();
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
                      searchResult: controller.jobSearchResult,
                      list: controller.jobList,
                      isSearching: controller.isJobSearching);
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
                    : controller.jobList.value.isEmpty
                    ? Center(
                  child: Text(
                    'Job\'s Not Available',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSpacings.s22,
                    ),
                  ),
                )
                    : controller.isJobSearching.value
                    ? buildListView(controller.jobSearchResult)
                    : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
                      itemCount: controller.jobList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.jobDetails,arguments:controller.jobList[index]);
                          },
                          child: Card(
                            margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5.5, // Change this
                            child:
                            // Padding(
                            // padding: const EdgeInsets.only(
                            //     top: 3.0, left: 3.0, bottom: 3.0),
                            // child:
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Padding(
                                //   padding: const EdgeInsets.only(top:5.0,left:5,bottom:5),
                                //   child: Container(
                                //     width: Get.height * 0.18,
                                //     height: Get.height * 0.18,
                                //     decoration: BoxDecoration(
                                //       shape: BoxShape.circle,
                                //       image: DecorationImage(
                                //         image: NetworkImage(
                                //           BaseUrl.ImageURL +
                                //               controller.jobList[index]
                                //                   .visitingCard,
                                //         ),
                                //         // image: AssetImage(
                                //         //   "./assets/logo.png",
                                //         // ),
                                //         fit: BoxFit.fill,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                              controller.jobList[index]
                                                  .visitingCard,
                                        ),
                                        fit: BoxFit.cover,
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
                                                Text(
                                                  "Company Name : ",
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
                                                    controller.jobList[index]
                                                        .companyName !=
                                                        null
                                                        ? controller.jobList[index]
                                                        .companyName
                                                        : '',
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    maxLines: 2,
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
                                            Row(
                                              children: [
                                                Text(
                                                  "Job Title : ",
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
                                                    controller.jobList[index]
                                                        .jobFor !=
                                                        null
                                                        ? controller.jobList[index]
                                                        .jobFor
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
                                                  "Salary : ",
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
                                                    controller.jobList[index]
                                                        .salary !=
                                                        null
                                                        ? controller.jobList[index]
                                                        .salary
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
                                                  "Person Name : ",
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
                                                    controller.jobList[index]
                                                        .memberName !=
                                                        null
                                                        ? controller.jobList[index]
                                                        .memberName
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
                                                    controller.jobList[index]
                                                        .mobileNumber !=
                                                        null
                                                        ? controller.jobList[index]
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

  Widget buildListView(RxList<JobModel> jobSearchResult) {
    return jobSearchResult.isEmpty
        ?Center(
      child: Text(
        'Job Not Available',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: AppSpacings.s22,
        ),
      ),
    ):Expanded(
      child:ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
          itemCount: jobSearchResult.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.jobDetails,arguments:jobSearchResult[index]);
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 7, // Change this
                child:
                // Padding(
                // padding: const EdgeInsets.only(
                //     top: 3.0, left: 3.0, bottom: 3.0),
                // child:
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.only(top:5.0,left:5,bottom:5),
                    //   child: Container(
                    //     width: Get.height * 0.18,
                    //     height: Get.height * 0.18,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //         image: NetworkImage(
                    //           BaseUrl.ImageURL +
                    //               jobSearchResult[index]
                    //                   .visitingCard,
                    //         ),
                    //         // image: AssetImage(
                    //         //   "./assets/logo.png",
                    //         // ),
                    //         fit: BoxFit.fill,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                                  jobSearchResult[index]
                                      .visitingCard,
                            ),
                            fit: BoxFit.cover,
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
                                    Text(
                                      "Company Name : ",
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
                                        jobSearchResult[index]
                                            .companyName !=
                                            null
                                            ? jobSearchResult[index]
                                            .companyName
                                            : '',
                                        overflow: TextOverflow
                                            .ellipsis,
                                        maxLines: 2,
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
                                Row(
                                  children: [
                                    Text(
                                      "Job Title : ",
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
                                        jobSearchResult[index]
                                            .jobFor !=
                                            null
                                            ? jobSearchResult[index]
                                            .jobFor
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
                                      "Salary : ",
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
                                        jobSearchResult[index]
                                            .salary !=
                                            null
                                            ? jobSearchResult[index]
                                            .salary
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
                                      "Person Name : ",
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
                                        jobSearchResult[index]
                                            .memberName !=
                                            null
                                            ? jobSearchResult[index]
                                            .memberName
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
                                        jobSearchResult[index]
                                            .mobileNumber !=
                                            null
                                            ? jobSearchResult[index]
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


