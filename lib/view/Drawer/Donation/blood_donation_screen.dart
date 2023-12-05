// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/api_constant.dart';
import '../../../common/spacing.dart';
import '../../../controllers/Donation/blood_donation_controller.dart';


class BloodDonationScreen extends GetView<BloodDonationController> {
  const BloodDonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Blood Donation",
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
      body: controller.isLoading.value ? Center(
          child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
              AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)))
          : controller.bloodDonationList.isEmpty
          ? Center(
        child: Text(
          'BloodDonation\'s Not Available',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: AppSpacings.s22,
          ),
        ),
      )
          : ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.fromLTRB  (0, AppSpacings.s2,0, 0),
         itemCount: controller.bloodDonationList.length,
         itemBuilder: (BuildContext ctx, index) {
           return  Padding(
             padding: const EdgeInsets.only(top:5.0),
             child: Card(
               margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
               elevation: 5.5, // Change this
               child: InkWell(
                 onTap: () {
                    Get.toNamed(Routes.donationDetail,arguments:controller.bloodDonationList[index]);
                 },
                 child: Row(
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
                                 Container(
                                   width: Get.height * 0.15,
                                   height: Get.height * 0.15,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     image: DecorationImage(
                                       image: NetworkImage(
                                         BaseUrl.ImageURL +
                                             controller.bloodDonationList[index]
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
                                                   controller.bloodDonationList[index]
                                                       .aboutDonation
                                                       !=
                                                       null
                                                       ? "${controller.bloodDonationList[index]
                                                       .aboutDonation.substring(0, 20)}....."
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
                                           SizedBox(
                                             height: 2.0,
                                           ),
                                           // Row(
                                           //   children: [
                                           //     Text(
                                           //       "Area : ",
                                           //       style: TextStyle(
                                           //           fontSize: 15.0,
                                           //           fontWeight:
                                           //           FontWeight
                                           //               .w700),
                                           //       textAlign:
                                           //       TextAlign.start,
                                           //     ),
                                           //     Text(
                                           //       "Bhatar",
                                           //       style: TextStyle(
                                           //           fontSize: 15.0,
                                           //           fontWeight:
                                           //           FontWeight
                                           //               .w400),
                                           //       textAlign:
                                           //       TextAlign.start,
                                           //     ),
                                           //   ],
                                           // ),
                                           // SizedBox(
                                           //   height: 2.0,
                                           // ),
                                           // Row(
                                           //   children: [
                                           //     Text(
                                           //       "Village : ",
                                           //       style: TextStyle(
                                           //           fontSize: 15.0,
                                           //           fontWeight:
                                           //           FontWeight
                                           //               .w700),
                                           //       textAlign:
                                           //       TextAlign.start,
                                           //     ),
                                           //     Text(
                                           //       "Mehsana",
                                           //       style: TextStyle(
                                           //           fontSize: 15.0,
                                           //           fontWeight:
                                           //           FontWeight
                                           //               .w400),
                                           //       textAlign:
                                           //       TextAlign.start,
                                           //     ),
                                           //   ],
                                           // ),
                                           // SizedBox(
                                           //   height: 2.0,
                                           // ),
                                           // Row(
                                           //   children: [
                                           //     Text(
                                           //       "Mobile : ",
                                           //       style: TextStyle(
                                           //           fontSize: 15.0,
                                           //           fontWeight:
                                           //           FontWeight
                                           //               .w700),
                                           //       textAlign:
                                           //       TextAlign.start,
                                           //     ),
                                           //     InkWell(
                                           //       child: Text(
                                           //         "1234567890",
                                           //         style: TextStyle(
                                           //             fontSize: 15.0,
                                           //             fontWeight:
                                           //             FontWeight
                                           //                 .w400),
                                           //         textAlign:
                                           //         TextAlign.start,
                                           //       ),
                                           //       // onTap: () async {
                                           //       //   var url =
                                           //       //       'tel:${filteredUsers[index].mobilenumber}';
                                           //       //   if (await canLaunch(url) != null) {
                                           //       //     await launch(url);
                                           //       //   } else {
                                           //       //     throw 'Could not launch $url';
                                           //       //   }
                                           //       // },
                                           //     ),
                                           //   ],
                                           // ),
                                           // SizedBox(
                                           //   height: 5.0,
                                           // ),
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
                 ),
               ),
             ),
           );
         }),
    ));
  }
}


