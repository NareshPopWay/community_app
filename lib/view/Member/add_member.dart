import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/themeService.dart';
import 'package:community_app/controllers/MemberController/member_controller.dart';
import 'package:community_app/models/PMemberModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/spacing.dart';
import '../../controllers/MemberController/add_member_controller.dart';

class AddMemberScreen extends GetView<AddMemberController> {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: ThemeService.primaryColor,
        elevation: 0.0,
        title: Text(
          "Member Registration",
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: controller.key,
              child: Column(
                children: <Widget>[

                  InkWell(
                      onTap: () {
                        controller.pickFile();
                        // _showPicker(context);
                      },
                      child: controller.selectedFile.value == null
                          ? CircleAvatar(
                        radius: 62,
                        backgroundColor: ThemeService.primaryColor,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: ThemeService.primaryColor,
                            child: Image.asset(
                              "assets/icon/ic_camera.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                          : Container(
                        width: Get.width * 0.30,
                        height: Get.width * 0.30,
                        decoration: BoxDecoration(
                          color: ThemeService.white,
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(AppSpacings.s100),
                          border: Border.all(color: ThemeService.primaryColor,width:2),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(62),
                            child: Image.file(controller.selectedFile.value!,
                              fit: BoxFit.cover,
                            )
                        ),
                      )

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller.memberNameController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Member Name is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Member Name',
                      labelText: "Member Name",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller.addressController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Address is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Address',
                      labelText: "Addresss",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                     controller: controller.areaController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Area is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Area',
                      labelText: "Area",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller.villageController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Village is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Village',
                      labelText: "Village",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor, //C40F18
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                     controller: controller.sakheController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Sakhe is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Sakhe',
                      labelText: "Sakhe",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.phone,
                    controller: controller.mobileNumberController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Mobile Number is Required";
                      }
                      return null;
                    },
                    inputFormatters: [
                      // new WhitelistingTextInputFormatter(
                      //     new RegExp(r'^[0-9]*$')),
                      new LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Mobile Number',
                      labelText: "Mobile Number",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller.usernameController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Username is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Username',
                      labelText: "Username",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor, //C40F18
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller.passwordController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Password is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(08)),
                      hintText: 'Password',
                      labelText: "Password",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.grayScale,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(08.0),
                        borderSide: BorderSide(
                          color: ThemeService.primaryColor, //C40F18
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (controller.isLoading.value == false)
                  GestureDetector(
                    onTap: () {
                      if (controller.key.currentState!.validate()) {
                        controller.isLoading.value = true;
                        controller.key.currentState!.save();
                        if(controller.selectedFile.value == null){
                          controller.isLoading.value = false;
                          Fluttertoast.showToast(
                              msg: "Please select Image",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }else{
                          controller.addMember();
                        }
                      }else{
                        controller.isLoading.value = false;
                      }
                     },
                    child: Container(
                      height: 55.0,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [
                            ThemeService.primaryColor,
                            ThemeService.grayScale,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Center(
                        child: Text("Register Member", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  )
                 else CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


