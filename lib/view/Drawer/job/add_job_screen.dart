import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/widget/simpledropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/themeService.dart';
import '../../../controllers/JobController/add_job_controller.dart';


class AddJobScreen extends GetView<AddJobController> {
  const AddJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: ThemeService.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: ThemeService.primaryColor,
        elevation: 0.0,
        title: Text(
          "Add Job",
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
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Card(
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
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.text,
                    controller: controller.companyNameController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Company Name is Required";
                      }
                      return null;
                    },
                    // onSaved: (e) => familyMemberName = e,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Company Name',
                      labelText: "Company Name",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    controller:  controller.addressController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Address is Required";
                      }
                      return null;
                    },
                    // onSaved: (e) => address = e,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Address',
                      labelText: "Addresss",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    controller:  controller.websiteController.value,
                    // validator: (e) {
                    //   if (e.isEmpty) {
                    //     return "Website Link is Required";
                    //   }
                    //   return null;
                    // },
                    // onSaved: (e) => area = e,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Company Website Link',
                      labelText: "Company Website Link",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    controller: controller.memberNameController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Contact Persion Name is Required";
                      }
                      return null;
                    },
                    // onSaved: (e) => area = e,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Contact Persion Name',
                      labelText: "Contact Persion Name",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    keyboardType: TextInputType.phone,
                    controller:  controller.mobileNumberController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Mobile Number is Required";
                      }
                      return null;
                    },
                    // onSaved: (e) => mobileNumber = e,
                    inputFormatters: [
                      // new WhitelistingTextInputFormatter(
                      //     new RegExp(r'^[0-9]*$')),
                      new LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Mobile Number',
                      labelText: "Mobile Number",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    keyboardType: TextInputType.phone,
                    controller:  controller.whatsappNumberController.value,
                    inputFormatters: [
                      // new WhitelistingTextInputFormatter(
                      //     new RegExp(r'^[0-9]*$')),
                       LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Whatsapp Number',
                      labelText: "Whatsapp Number",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    keyboardType: TextInputType.emailAddress,
                    controller:  controller.emailController.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Email',
                      labelText: "Email",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    controller:  controller.jobForController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Job Title is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Job Title',
                      labelText: "Job Title",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    controller:  controller.jobLocationController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Job Location is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Job Location',
                      labelText: "Job Location",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    keyboardType: TextInputType.number,
                    controller:  controller.salaryController.value,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Salary is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Salary',
                      labelText: "Salary",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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
                    controller:  controller.jobDetailsController.value,
                    maxLines: 10,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Job Detail is Required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Job Details',
                      labelText: "Job Details",
                      labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                      errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                      // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: ThemeService.Scolor,
                          //color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
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

                  if (controller.isLoading.value == false)
                    GestureDetector(
                      onTap: () {
                        // check();
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
                            controller.addJob();
                          }

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
                          child: Text("Add Job", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
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
          // ),
        ),
      ),
    ));
  }
}


