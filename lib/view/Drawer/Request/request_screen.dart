
// ignore_for_file: must_be_immutable

import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/routes/app_routes.dart';
import '../../../controllers/Request_controller/requesr_controller.dart';


class RequestScreen extends GetView<RequestController> {
  RequestScreen({Key? key}) : super(key: key);

  RequestController controller = Get.put(RequestController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        title: Text(
          "Request",
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
      floatingActionButton:controller.userTypeId.value == "1" ? FloatingActionButton(
        backgroundColor: ThemeService.primaryColor,
        onPressed: () {
          Get.toNamed(Routes.addRequest);
        },
        child: Icon(MdiIcons.notebookPlus, color: Colors.white),
      ):Container(),
      body: AnimationLimiter(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: controller.item.length,
            padding: EdgeInsets.only(top: Get.height*0.02),
            itemBuilder: (context, index){
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds:1000),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: _buildMenuItem(index)),
                ),
              );
            }),
      ),
    ));
  }

  Widget _buildMenuItem(int index){

    return GestureDetector(
      onTap: (){
        Get.toNamed(controller.screens[index]);
      },
      child: Container(
        height: Get.height*0.10,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal:Get.width*0.05,vertical:Get.height*0.01),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(Get.width*0.21, 0, Get.width*0.04, 0),
              decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                    ),
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Padding(
                    padding:  EdgeInsets.only(left: Get.width*0.03),
                    child: Text(controller.item[index],
                      style: TextStyle(
                          fontSize:Get.width*0.05,
                          color:const Color(0xff203e5f),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:const EdgeInsets.all(05),
                height: Get.height*0.10,
                width: Get.width*0.18,
                decoration: BoxDecoration(
                    color: ThemeService.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      ),
                    ]
                ),
                child: Image.asset(controller.image[index],),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(controller.screens[index]);
                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>menuScreens[index]));
                  //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade,duration:const Duration(milliseconds: 400),reverseDuration:const Duration(milliseconds: 400) , child: menuScreens[index]));
                },
                child: Container(
                  height: Get.height*0.05,
                  width: Get.width*0.09,
                  decoration: BoxDecoration(
                    color: ThemeService.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size:Get.height*0.022, )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


