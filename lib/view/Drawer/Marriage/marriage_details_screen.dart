import 'package:community_app/controllers/MarriageController/marriage_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../common/api_constant.dart';
import '../../../common/themeService.dart';


class MarriageDetailsScreen extends GetView<MarriageDetailController> {
  const MarriageDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Detail",
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
            Padding(
              padding: const EdgeInsets.only(top:5.0,left: 5.0,bottom: 5.0,right: 5.0),
              child:   Container(
                height: Get.height * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        // "Member Name : \n ${controller.model!.membername}",
                        "${controller.model!.name}",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        // "Sabhasad Number : ${controller.model!.sabhasadno}",
                        "${controller.model!.marriageId}",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w900,
                            color: ThemeService.primaryColor),
                            textAlign: TextAlign.end,
                       ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.0,
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
                              "Member Details :",
                              style: GoogleFonts.aBeeZee(
                                  color: ThemeService.primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              " Address : ",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Flexible(
                              // child: Container(
                              child: Text(
                                "${controller.model!.address}",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                maxLines: 5,
                              ),
                              // ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Village : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.village}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Sakhe : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.sakhe}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Samaj : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.samajName}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Hobby : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.hobby}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Marital Status : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.maritalStatus}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Gender : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.gender}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Hight : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.hight}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Weight : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.weight}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Date Of Birth : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${DateFormat('dd/MM/yyyy').format(controller.model!.birthDate)}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Family Details :",
                                style: GoogleFonts.aBeeZee(
                                    color: ThemeService.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Father Name : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.fatherName}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Mother Name : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.motherName}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Father Occupation : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.fatherOccupation}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Father Mobile Number : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.fatherMobileNumber}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Father Income : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.fatherIncome}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Other Details :",
                                style: GoogleFonts.aBeeZee(
                                    color: ThemeService.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Mosal : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.mosal}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          // thickness: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Number Of Brother : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.numberOfBrother}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          // thickness: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Number Of Sister : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.numberOfSister}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Remark : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.remark}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: ThemeService.Scolor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}


