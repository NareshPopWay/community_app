import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white54, Colors.transparent],
            ).createShader(rect),
            blendMode: BlendMode.darken,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/bg.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   "Version : ",
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.bold,
                                //       // decoration: TextDecoration.underline,
                                //       letterSpacing: 0.5),
                                // ),
                                // Text(
                                //   "1.0 ", //Old : 1.6
                                //   style: TextStyle(
                                //       color: Mcolor,
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w900,
                                //       // decoration: TextDecoration.underline,
                                //       letterSpacing: 0.5),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                              child: Image.asset(
                                "assets/logo.png",
                                height: Get.height * 0.20,
                                width: Get.width * 0.75,
                                alignment: Alignment.center,
                              )),
                        ),
                        Expanded(
                          flex: 4,
                          child: Form(
                            key: controller.key,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      keyboardType: TextInputType.text,
                                      controller: controller.userName.value,
                                      style: TextStyle(
                                          color: ThemeService.white
                                      ),
                                      validator: (e) {
                                        if (e!.isEmpty) {
                                          return "UserName is Required";
                                        }
                                      },
                                      // onSaved: (e) => Username = e,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(25)),
                                        hintText: 'User Name',
                                        labelText: "User Name *",
                                        labelStyle: GoogleFonts.aBeeZee(
                                            color: Colors.white),
                                        errorStyle: GoogleFonts.aBeeZee(
                                            color: Colors.red),
                                        prefixIcon: Icon(
                                          MdiIcons.accountCircle,
                                          color: Colors.white,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: ThemeService.Scolor,
                                            //color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white, //C40F18
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      keyboardType: TextInputType.text,
                                      obscureText: controller.secureText.value,
                                      controller: controller.password.value,
                                      style: TextStyle(
                                        color: ThemeService.white
                                      ),
                                      validator: (e) {

                                        if (e!.isEmpty) {
                                          return "Password is Required";
                                        }
                                      },
                                      // onSaved: (e) => Password = e,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(25)),
                                        hintText: 'Password',
                                        labelText: "Password *",
                                        labelStyle: GoogleFonts.aBeeZee(
                                            color: Colors.white),
                                        errorStyle: GoogleFonts.aBeeZee(
                                            color: Colors.red),
                                        prefixIcon: Icon(
                                          MdiIcons.key,
                                          color: Colors.white,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white, //C40F18
                                            width: 2.0,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.secureText.value =
                                            !controller.secureText.value;
                                          },
                                          icon: Icon(controller.secureText.value
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (controller.key.currentState!
                                          .validate()) {
                                        controller.key.currentState!.save();
                                        controller.login();
                                      }
                                    },
                                    child: Container(
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                        gradient: LinearGradient(
                                          colors: [
                                            ThemeService.primaryColor,
                                            ThemeService.grayScale,
                                          ],
                                          begin:
                                          const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 0.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Stack(
                                  //   children: [
                                  //     Container(
                                  //       alignment: Alignment.center,
                                  //       width: double.infinity,
                                  //       padding: EdgeInsets.symmetric(
                                  //           vertical: 10, horizontal: 0),
                                  //       height: 50,
                                  //       decoration: BoxDecoration(
                                  //         borderRadius:
                                  //         BorderRadius.circular(20.0),
                                  //         gradient: LinearGradient(
                                  //           colors: [
                                  //             Mcolor,
                                  //             Scolor,
                                  //           ],
                                  //           begin: const FractionalOffset(
                                  //               0.0, 0.0),
                                  //           end: const FractionalOffset(
                                  //               1.0, 0.0),
                                  //           stops: [0.0, 1.0],
                                  //           tileMode: TileMode.clamp,
                                  //         ),
                                  //       ),
                                  //       child: InkWell(
                                  //         onTap: () {
                                  //           check();
                                  //         },
                                  //         child: Text(
                                  //           "Login",
                                  //           textAlign: TextAlign.center,
                                  //           style: TextStyle(
                                  //               color: Colors.white54,
                                  //               fontSize: 16,
                                  //               letterSpacing: 1),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     // Positioned(child: (isLoading)?Center(child: Container(height:26,width: 26,child: CircularProgressIndicator(backgroundColor: Colors.green,))):Container(),right: 30,bottom: 0,top: 0,),
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           "Version : ",
                        //           style: GoogleFonts.aBeeZee(
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.bold,
                        //               // decoration: TextDecoration.underline,
                        //               letterSpacing: 0.5),
                        //         ),
                        //         Text(
                        //           "1.0",
                        //           style: GoogleFonts.aBeeZee(
                        //               color: Colors.deepOrangeAccent.shade400,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w900,
                        //               // decoration: TextDecoration.underline,
                        //               letterSpacing: 0.5),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
