import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../common/api_constant.dart';
import '../../common/themeService.dart';
import '../../controllers/MemberController/member_detail_controller.dart';

class MemberDetailsScreen extends GetView<MemberDetailController> {
  const MemberDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Member Detail",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  // "Sabhasad Number : ${controller.model!.sabhasadno}",
                  "${controller.model!.memberId}",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                      color: ThemeService.primaryColor),
                  textAlign: TextAlign.end,
                ),
                Text(
                  // "Member Name : \n ${controller.model!.membername}",
                  "${controller.model!.memberName}",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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
                            Text(
                              "${controller.model!.address}",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                              maxLines: 5,
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
                              Container(
                                child: Text(
                                  "${controller.model!.village}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                              Container(
                                child: Text(
                                  "${controller.model!.sakhe}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 2,
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
                              Container(
                                child: Text(
                                  "${controller.model!.gender}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 2,
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
                              Container(
                                child: Text( controller.model!.birthDate != null ?
                                  "${DateFormat('dd/MM/yyyy').format(controller.model!.birthDate)}":'',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 10,
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
                                "Contact Details :",
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
                                "Mobile Number : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.mobileNumber}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                                "Whatsapp Number : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.whatsappNumber}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                                "Email : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.email}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                                "Education : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.education}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                                "Marital Status : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.maritalStatus}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                                "Occupation : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.occupation}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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
                                "Blood Group : ",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                child: Text(
                                  "${controller.model!.bloodGroup}",
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
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


