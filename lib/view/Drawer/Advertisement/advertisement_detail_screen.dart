import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/api_constant.dart';
import '../../../common/themeService.dart';
import '../../../controllers/AdvertisementController/advertisement_detail_controller.dart';


class AdvertisementDetailsScreen extends GetView<AdvertisementDetailController> {
  const AdvertisementDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeService.primaryColor,
          title: Text(
            "Advertisement Detail",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                              "Advertisement Details :",
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
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            Icon(
                              FeatherIcons.user,
                            ),
                            SizedBox(
                              width: Get.width * 0.03,
                            ),
                            Flexible(
                              // child: Container(
                              child: Text(
                                "${controller.model!.memberName}",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
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
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.aboutAdvertisement}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Contact Person Details :",
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
                              Icon(
                                FeatherIcons.phone,
                              ),
                              SizedBox(
                                width: Get.width * 0.03,
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.mobileNumber}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
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
                              Icon(
                                MdiIcons.whatsapp,
                              ),
                              SizedBox(
                                width: Get.width * 0.03,
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    "${controller.model!.whatsappNumber}",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
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


