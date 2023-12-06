// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/models/addvertisement_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../controllers/AdvertisementController/advertisement_controller.dart';


class AdvertisementScreen extends GetView<AdvertisementController> {
  AdvertisementScreen({Key? key}) : super(key: key);

  AdvertisementController controller = Get.put(AdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Advertisement",
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
          Get.toNamed(Routes.addAdvertisement);
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
                placeholder: 'Search Advertisement',
                controller: controller.searchText.value,
                placeholderStyle: TextStyle(
                    fontSize: AppSpacings.s18,
                    color: Get.theme.disabledColor),
                onSuffixTap: () {
                  controller.isAdvertisementSearching.value = false;
                  controller.advertisementSearchResult.clear();
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
                      searchResult: controller.advertisementSearchResult,
                      list: controller.advertisementList,
                      isSearching: controller.isAdvertisementSearching);
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
                    : controller.advertisementList.value.isEmpty
                    ? Center(
                  child: Text(
                    'Advertisement\'s Not Available',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSpacings.s22,
                    ),
                  ),
                )
                    : controller.isAdvertisementSearching.value
                    ? buildListView(controller.advertisementSearchResult)
                    : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
                      itemCount: controller.advertisementList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.advertisementDetails,arguments:controller.advertisementList[index]);
                          },
                          child: Card(
                            margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5.5,
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
                                    width: Get.height * 0.15,
                                    height: Get.height * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          BaseUrl.ImageURL +
                                              controller.advertisementList[index]
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
                                                  "Member Name : ",
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
                                                    controller.advertisementList[index]
                                                        .memberName !=
                                                        null
                                                        ? controller.advertisementList[index]
                                                        .memberName
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
                                                    controller.advertisementList[index]
                                                        .mobileNumber !=
                                                        null
                                                        ? controller.advertisementList[index]
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
                                                Flexible(
                                                  child: Text(
                                                    controller.advertisementList[index]
                                                        .aboutAdvertisement
                                                        !=
                                                        null
                                                        ? controller.advertisementList[index]
                                                        .aboutAdvertisement.length >= 2 ? controller.advertisementList[index]
                                                        .aboutAdvertisement
                                                        :"${controller.advertisementList[index]
                                                        .aboutAdvertisement.substring(0, 25)}....."
                                                        : '',
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                    maxLines: 5,
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
                                            // Container(
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.end,
                                            //     children: [
                                            //       Container(
                                            //         width: Get.width/10,
                                            //         height: Get.height/20,
                                            //         margin: EdgeInsets.all(5),
                                            //         padding: EdgeInsets.zero,
                                            //         decoration: BoxDecoration(
                                            //             borderRadius:
                                            //             BorderRadius.circular(100),
                                            //             gradient: LinearGradient(
                                            //                 begin: Alignment.topLeft,
                                            //                 end: Alignment.bottomRight,
                                            //                 colors: [
                                            //                   Mcolor,
                                            //                   Scolor
                                            //                 ])
                                            //         ),
                                            //         child: IconButton(
                                            //           onPressed: () {
                                            //             Navigator.of(ctx).push(
                                            //                 MaterialPageRoute(
                                            //                     builder: (ctx) =>
                                            //                         EditMember(snapshot.data[index],FamilyMember_Manager(LoginAuthorizetoken).findall())
                                            //                 ));
                                            //           },
                                            //           icon: Icon(Icons.edit,
                                            //               color: Colors.white),
                                            //         ),
                                            //       ),
                                            //       Container(
                                            //         width: Get.width/10,
                                            //         height: Get.height/20,
                                            //         margin: EdgeInsets.all(5),
                                            //         padding: EdgeInsets.zero,
                                            //         decoration: BoxDecoration(
                                            //             borderRadius:
                                            //             BorderRadius.circular(100),
                                            //             gradient: LinearGradient(
                                            //                 begin: Alignment.topLeft,
                                            //                 end: Alignment.bottomRight,
                                            //                 colors: [
                                            //                   Mcolor,
                                            //                   Scolor
                                            //                 ])
                                            //         ),
                                            //         child: IconButton(
                                            //           onPressed: () {
                                            //             dialogDelete(snapshot.data[index].familyMemberId.toString());
                                            //           },
                                            //           icon: Icon(Icons.delete,
                                            //               color: Colors.white),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
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

  Widget buildListView(RxList<AdvertisementModel> advertisementSearchResult) {
    return advertisementSearchResult.isEmpty
        ?Center(
      child: Text(
        'Advertisement Not Available',
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
          itemCount: advertisementSearchResult.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.advertisementDetails,arguments:advertisementSearchResult[index]);
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
                    Padding(
                      padding: const EdgeInsets.only(top:5.0,left:5,bottom:5),
                      child: Container(
                        width: Get.height * 0.18,
                        height: Get.height * 0.18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              BaseUrl.ImageURL +
                                  advertisementSearchResult[index]
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
                                    Text(
                                      "Member Name : ",
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
                                        advertisementSearchResult[index]
                                            .memberName !=
                                            null
                                            ? advertisementSearchResult[index]
                                            .memberName
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
                                        advertisementSearchResult[index]
                                            .mobileNumber !=
                                            null
                                            ? advertisementSearchResult[index]
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
                                    Flexible(
                                      child: Text(
                                        advertisementSearchResult[index]
                                            .aboutAdvertisement
                                            !=
                                            null
                                            ? "${advertisementSearchResult[index]
                                            .aboutAdvertisement.substring(0, 25)}....."
                                            : '',
                                        overflow:
                                        TextOverflow
                                            .ellipsis,
                                        maxLines: 5,
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
                                // Container(
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.end,
                                //     children: [
                                //       Container(
                                //         width: Get.width/10,
                                //         height: Get.height/20,
                                //         margin: EdgeInsets.all(5),
                                //         padding: EdgeInsets.zero,
                                //         decoration: BoxDecoration(
                                //             borderRadius:
                                //             BorderRadius.circular(100),
                                //             gradient: LinearGradient(
                                //                 begin: Alignment.topLeft,
                                //                 end: Alignment.bottomRight,
                                //                 colors: [
                                //                   Mcolor,
                                //                   Scolor
                                //                 ])
                                //         ),
                                //         child: IconButton(
                                //           onPressed: () {
                                //             Navigator.of(ctx).push(
                                //                 MaterialPageRoute(
                                //                     builder: (ctx) =>
                                //                         EditMember(snapshot.data[index],FamilyMember_Manager(LoginAuthorizetoken).findall())
                                //                 ));
                                //           },
                                //           icon: Icon(Icons.edit,
                                //               color: Colors.white),
                                //         ),
                                //       ),
                                //       Container(
                                //         width: Get.width/10,
                                //         height: Get.height/20,
                                //         margin: EdgeInsets.all(5),
                                //         padding: EdgeInsets.zero,
                                //         decoration: BoxDecoration(
                                //             borderRadius:
                                //             BorderRadius.circular(100),
                                //             gradient: LinearGradient(
                                //                 begin: Alignment.topLeft,
                                //                 end: Alignment.bottomRight,
                                //                 colors: [
                                //                   Mcolor,
                                //                   Scolor
                                //                 ])
                                //         ),
                                //         child: IconButton(
                                //           onPressed: () {
                                //             dialogDelete(snapshot.data[index].familyMemberId.toString());
                                //           },
                                //           icon: Icon(Icons.delete,
                                //               color: Colors.white),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
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


