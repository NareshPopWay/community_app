import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/about_us_controller.dart';
import 'package:community_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends GetView<AboutUsController> {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: ThemeService.primaryColor,
        //   title: Text(
        //     "Notification",
        //     style: GoogleFonts.aBeeZee(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20,
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ThemeService.primaryColor,
                            ThemeService.Scolor,
                          ])),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    elevation: 16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Image(
                              height: Get.width * 0.50,
                              image: AssetImage(
                                "./assets/logo.png",
                              ),
                              fit: BoxFit.cover //(./assets/logo.png)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Image(
                              width: double.infinity,
                              image: AssetImage(
                                "./assets/a.jpg",
                              ),
                              fit: BoxFit.cover //(./assets/logo.png)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}


