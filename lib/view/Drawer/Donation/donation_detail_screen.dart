// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/api_constant.dart';
import '../../../common/spacing.dart';
import '../../../controllers/Donation/blood_donation_controller.dart';
import '../../../controllers/Donation/donation_detail_controller.dart';
import '../../../controllers/Donation/money_donation_controller.dart';


class DonationDetailScreen extends GetView<DonationDetailController> {
  const DonationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Donation Detail",
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
      body: SingleChildScrollView(
        child:  Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top:5.0,left: 5.0,bottom: 5.0),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 3.0),
            //     child: CircleAvatar(
            //       radius: 120.0,
            //       backgroundImage: NetworkImage(
            //         BaseUrl.ImageURL + controller.model!.fileData,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top:5.0,left: 5.0,bottom: 5.0,right: 5.0),
              child:   Container(
                height: Get.height * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      BaseUrl.ImageURL + controller.model!.fileData,
                    ),
                    // image: AssetImage(
                    //   "./assets/logo.png",
                    // ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Details :",
                          style: GoogleFonts.aBeeZee(
                              color: ThemeService.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            child: Text(
                              "${controller.model!.aboutDonation}",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400
                              ),
                              maxLines: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


