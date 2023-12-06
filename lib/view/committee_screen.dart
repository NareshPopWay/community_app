import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:community_app/controllers/committee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommitteeScreen extends GetView<ComumitteeController> {
  const CommitteeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: ThemeService.primaryColor,
        //   title: Text(
        //     "Committee",
        //     style: GoogleFonts.aBeeZee(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20,
        //     ),
        //   ),
        //   centerTitle: true,
        //   actions: <Widget>[
        //     IconButton(
        //       onPressed: () {
        //         // Navigator.of(context).push(
        //         //     new MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
        //       },
        //       icon: Icon(FeatherIcons.search),
        //     ),
        //   ],
        // ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.fromLTRB(0, AppSpacings.s20,0, 0),
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.fromLTRB(AppSpacings.s15, 0, AppSpacings.s15, AppSpacings.s25),
                    elevation: 5.5, // Change this
                    //shadowColor: ThemeService.primaryColor,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //         Detail(list[i])));
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3.0, left: 3.0, bottom: 3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: Get.height * 0.15,
                                        height: Get.height * 0.15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "./assets/logo.png",
                                            ),
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
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                    "101",
                                                    style: GoogleFonts.aBeeZee(
                                                      color: ThemeService.grayScalecon,
                                                      fontWeight:
                                                      FontWeight.w900,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Jhon Doi",
                                                        overflow: TextOverflow
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
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Designation : ",
                                                        style: GoogleFonts.aBeeZee(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w700),
                                                        textAlign:
                                                        TextAlign.start,
                                                      ),
                                                      Text(
                                                        "Oditor",
                                                        style: GoogleFonts.aBeeZee(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                        textAlign:
                                                        TextAlign.start,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Village : ",
                                                        style: GoogleFonts.aBeeZee(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w700),
                                                        textAlign:
                                                        TextAlign.start,
                                                      ),
                                                      Text(
                                                        "Mehsana",
                                                        style: GoogleFonts.aBeeZee(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                        textAlign:
                                                        TextAlign.start,
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
                                                          "1234567890",
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
                                                    height: 5.0,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}


