// ignore_for_file: unnecessary_null_comparison

import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/Donation/blood_donation_controller.dart';
import '../../../controllers/Donation/money_donation_controller.dart';


class MoneyDonationScreen extends GetView<MoneyDonationController> {
  const MoneyDonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Money Donation",
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
    ));
  }
}


