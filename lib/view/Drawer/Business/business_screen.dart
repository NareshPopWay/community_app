// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/routes/app_routes.dart';
import '../../../controllers/BusinessController/business_controller.dart';
import '../../../models/business_model.dart';

class BusinessScreen extends GetView<BusinessController> {
  BusinessScreen({Key? key}) : super(key: key);

  BusinessController controller = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Business",
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
         Get.toNamed(Routes.addBusiness);
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
                placeholder: 'Search Business',
                controller: controller.searchText.value,
                placeholderStyle: TextStyle(
                    fontSize: AppSpacings.s18,
                    color: Get.theme.disabledColor),
                onSuffixTap: () {
                  controller.isBusinessSearching.value = false;
                  controller.businessSearchResult.clear();
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
                      searchResult: controller.businessSearchResult,
                      list: controller.businessList,
                      isSearching: controller.isBusinessSearching);
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
                    : controller.businessList.value.isEmpty
                    ? Center(
                  child: Text(
                    'Business\'s Not Available',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSpacings.s22,
                    ),
                  ),
                )
                    : controller.isBusinessSearching.value
                    ? buildListView(controller.businessSearchResult)
                    : Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                          padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
                          itemCount: controller.businessList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //Get.toNamed(Routes.jobDetails,arguments:controller.businessList[index]);
                              },
                              child: Card(
                                margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5.5, // Change this
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
                                              controller.businessList[index]
                                                  .visitingCard,
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
                                              controller.businessList[index]
                                                  .memberName ?? '',
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
                                            "Business Name : ",
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
                                              controller.businessList[index]
                                                  .businessName ?? '',
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
                                              controller.businessList[index]
                                                  .mobileNumber ?? '',
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

  Widget buildListView(RxList<BusinessModel> businessSearchResult) {
    return businessSearchResult.isEmpty
        ?Center(
      child: Text(
        'Business Not Available',
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
          itemCount: businessSearchResult.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Get.toNamed(Routes.jobDetails,arguments:businessSearchResult[index]);
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5.5, // Change this
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
                              businessSearchResult[index]
                                  .visitingCard,
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
                             businessSearchResult[index]
                                  .memberName ?? '',
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
                            "Business Name : ",
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
                              businessSearchResult[index]
                                  .businessName ?? '',
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
                              businessSearchResult[index]
                                  .mobileNumber ?? '',
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


