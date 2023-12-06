// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/FeedBack/feedback_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class FeedBackScreen extends GetView<FeedBackController> {
  FeedBackScreen({Key? key}) : super(key: key);

  FeedBackController controller = Get.put(FeedBackController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "FeedBack",
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
          Get.toNamed(Routes.addFeedBack);
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
          // Container(
          //   margin: EdgeInsets.fromLTRB(AppSpacings.s20, AppSpacings.s5,
          //       AppSpacings.s20, AppSpacings.s20),
          //   child: Center(
          //     child: CupertinoSearchTextField(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: ThemeService.grayScale.withOpacity(.7),
          //           border: Border.all(color: ThemeService.primaryColor)
          //       ),
          //       // backgroundColor: ThemeService.grayScale.withOpacity(.7),
          //       itemColor: ThemeService.black,
          //       placeholder: 'Search Job',
          //       controller: controller.searchText.value,
          //       placeholderStyle: TextStyle(
          //           fontSize: AppSpacings.s18,
          //           color: Get.theme.disabledColor),
          //       onSuffixTap: () {
          //         controller.isJobSearching.value = false;
          //         controller.jobSearchResult.clear();
          //         controller.searchText.value.clear();
          //         FocusScope.of(context).unfocus();
          //       },
          //       suffixIcon: Icon(
          //         Icons.cancel,
          //         size: AppSpacings.s30,
          //         color: ThemeService.primaryColor,
          //       ),
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Icon(
          //           Icons.search,
          //           size: AppSpacings.s30,
          //           color: ThemeService.primaryColor,
          //         ),
          //       ),
          //       onChanged: (value) {
          //         controller.onSearch(value.toString(),
          //             searchResult: controller.jobSearchResult,
          //             list: controller.jobList,
          //             isSearching: controller.isJobSearching);
          //         if(controller.searchText.value.text.isEmpty){
          //           FocusScope.of(context).unfocus();
          //         }
          //       },
          //     ),
          //   ),
          // ),
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
                    : controller.feedBackList.value.isEmpty
                    ? Center(
                  child: Text(
                    'FeedBack\'s Not Available',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSpacings.s22,
                    ),
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
                      itemCount: controller.feedBackList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //Get.toNamed(Routes.jobDetails,arguments:controller.jobList[index]);
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
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 5.0, bottom: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Member Name : ",
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
                                                          Flexible(
                                                            child: Text(
                                                              controller.feedBackList[index]
                                                                  .memberName !=
                                                                  null
                                                                  ? controller.feedBackList[index]
                                                                  .memberName
                                                                  : '',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                  color: ThemeService.grayScale,
                                                                  fontSize:
                                                                  15.0,
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
                                                          Flexible(
                                                            child: Text(
                                                              controller.feedBackList[index]
                                                                  .village !=
                                                                  null
                                                                  ? controller.feedBackList[index]
                                                                  .village
                                                                  : '',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                  color: ThemeService.grayScale,
                                                                  fontSize:
                                                                  15.0,
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
                                                            "Feedback : ",
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
                                                          Flexible(
                                                            child: Text(
                                                              controller.feedBackList[index]
                                                                  .feedbacks
                                                                  !=
                                                                  null
                                                                  ? controller.feedBackList[index]
                                                                  .feedbacks
                                                                  : '',
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 10,
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
                                ),
                              ],
                            )
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
}


