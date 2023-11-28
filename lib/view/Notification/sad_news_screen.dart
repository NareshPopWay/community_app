// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/api_constant.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/NotificationController/sad_news_controller.dart';

class SadNewsScreen extends GetView<SadNewsController> {
  const SadNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Sad News",
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
        body: controller.isLoading.value
            ? Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
            : controller.sadNewsList.isEmpty
            ? Center(
          child: Text(
            'SadNews Not Available',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: AppSpacings.s20,
            ),
          ),
        )
            :ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: controller.sadNewsList.length,
            padding: EdgeInsets.only(top:AppSpacings.s10),
            itemBuilder: (BuildContext ctx, index){
              return  Padding(
                padding:  EdgeInsets.only(left:AppSpacings.s10,right:AppSpacings.s10,bottom: AppSpacings.s5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5, // Change this
                  //shadowColor: ThemeService.primaryColor,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.notificationDetails,arguments:controller.sadNewsList[index]);
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: Get.height * 0.10,
                                      height: Get.height * 0.10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            BaseUrl.ImageURL +
                                                controller.sadNewsList[index]
                                                    .fileData,
                                          ),
                                          // image: AssetImage(
                                          //   "./assets/logo.png",
                                          // ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      controller.sadNewsList[index]
                                                          .aboutNotification != null
                                                          ? "${controller.sadNewsList[index]
                                                          .aboutNotification}....."
                                                          : '',
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      maxLines: 3,
                                                      style: GoogleFonts.aBeeZee(
                                                          fontSize: AppSpacings.s20,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
    ));
  }
}


