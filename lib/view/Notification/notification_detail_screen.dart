import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/api_constant.dart';
import '../../controllers/NotificationController/notification_details_controller.dart';

class NotificationDetailScreen extends GetView<NotificationDetailsController> {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Notification Detail",
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
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          children: [

            Container(
              height: Get.height * 0.30,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(
                    BaseUrl.ImageURL +
                         controller.model!.fileData,
                  ),
                  // image: AssetImage(
                  //   "./assets/logo.png",
                  // ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top:5.0,left: 5.0,bottom: 5.0),
            //   child: Hero(
            //     tag:controller.model!['notificationId'],
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 3.0),
            //       child: CircleAvatar(
            //         radius: 120.0,
            //         backgroundImage: NetworkImage(
            //           BaseUrl.ImageURL + controller.model!['fileData'],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: AppSpacings.s10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Details :",
                        style: GoogleFonts.aBeeZee(
                            color: ThemeService.primaryColor,
                            fontSize: AppSpacings.s30,
                            fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSpacings.s15,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(
                            "${controller.model!.aboutNotification}",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.aBeeZee(
                                fontSize: AppSpacings.s22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}


