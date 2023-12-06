// ignore_for_file: unnecessary_null_comparison
import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/models/marksheet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../controllers/MarkSheetController/marksheet_controller.dart';


class MarksheetScreen extends GetView<MarksheetController> {
  MarksheetScreen({Key? key}) : super(key: key);

  MarksheetController controller = Get.put(MarksheetController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Marksheet",
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
      floatingActionButton:controller.userTypeId.value == "1" ? FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
          Get.toNamed(Routes.addMarksheet);
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
                  controller.isMarksheetSearching.value = false;
                  controller.marksheetSearchResult.clear();
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
                      searchResult: controller.marksheetSearchResult,
                      list: controller.marksheetList,
                      isSearching: controller.isMarksheetSearching);
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
                    : controller.marksheetList.value.isEmpty
                    ? Center(
                  child: Text(
                    'Marksheet\'s Not Available',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSpacings.s22,
                    ),
                  ),
                )
                    : controller.isMarksheetSearching.value
                    ? buildListView(controller.marksheetSearchResult)
                    : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
                      itemCount: controller.marksheetList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //Get.toNamed(Routes.jobDetails,arguments:controller.marksheetList[index]);
                          },
                          child:Card(
                            margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  // Expanded(
                                  //     child:
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.network(
                                      BaseUrl.ImageURL +
                                          controller.marksheetList[index]
                                              .marksheetImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  // ),
                                  SizedBox(
                                    height: Get.height*0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          controller.marksheetList[index]
                                              .studentName !=
                                              null
                                              ? controller.marksheetList[index]
                                              .studentName
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Qualification : ",
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
                                          controller.marksheetList[index]
                                              .qualification !=
                                              null
                                              ? controller.marksheetList[index]
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Medium Type : ",
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
                                          controller.marksheetList[index]
                                              .mediumType !=
                                              null
                                              ? controller.marksheetList[index]
                                              .mediumType
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mobile NO. : ",
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
                                          controller.marksheetList[index]
                                              .mobileNumber !=
                                              null
                                              ? controller.marksheetList[index]
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

  Widget buildListView(RxList<MarksheetModel> marksheetSearchResult) {
    return marksheetSearchResult.isEmpty
        ?Center(
      child: Text(
        'MarkSheet Not Available',
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
          itemCount: marksheetSearchResult.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
               // Get.toNamed(Routes.jobDetails,arguments:marksheetSearchResult[index]);
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: <Widget>[
                      // Expanded(
                      //     child:
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.network(
                          BaseUrl.ImageURL +
                              marksheetSearchResult[index]
                                  .marksheetImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // ),
                      SizedBox(
                        height: Get.height*0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              marksheetSearchResult[index]
                                  .studentName !=
                                  null
                                  ? marksheetSearchResult[index]
                                  .studentName
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Qualification : ",
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
                              marksheetSearchResult[index]
                                  .qualification !=
                                  null
                                  ? marksheetSearchResult[index]
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
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Medium Type : ",
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
                              marksheetSearchResult[index]
                                  .mediumType !=
                                  null
                                  ? marksheetSearchResult[index]
                                  .mediumType
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Mobile NO. : ",
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
                              marksheetSearchResult[index]
                                  .mobileNumber !=
                                  null
                                  ? marksheetSearchResult[index]
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
              ),
            );
          }),
    );
  }
}


