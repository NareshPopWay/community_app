import 'dart:developer';

import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../common/widget/simpledropdown.dart';
import '../../../controllers/MarriageController/add_marriage_controller.dart';

class AddMarriageScreen extends GetView<AddMarriageController> {
  const AddMarriageScreen({Key? key}) : super(key: key);

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
          "Marriage Registration",
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
      body: Stepper(
        type: StepperType.horizontal,
        elevation: 0.0,
        steps: [
          Step(
            title: const Flexible(child: Text("Personal")),
            content:Form(
              key: controller.key,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        controller.pickFile();
                        // _showPicker(context);
                      },
                      child: controller.selectedFile.value == null
                          ? Container(
                        width: Get.width * 0.30,
                        height: Get.width * 0.30,
                        child: CircleAvatar(
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.nameController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Member Name is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Member Name',
                        labelText: "Member Name",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:  BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///Gender
                  dropDwonWidget(
                    list: controller.genderList.value,
                    selectedValue: controller.selectedGender,
                    selectedId: controller.selectedGenderId,
                    emptyTitle: "Select Gender",
                    isExpanded: controller.isGenderExpanded,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Stack(
                    children: [
                      Container(
                        child: TextFormField(
                          style: GoogleFonts.aBeeZee(),
                          cursorColor: ThemeService.primaryColor,
                          keyboardType: TextInputType.datetime,
                          controller: controller.dateinput.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Birth Date is Required";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.birthDate = DateTime.parse(value!);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Birth Date',
                            labelText: "Birth Date",
                            labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                            errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                            // prefixIcon: Icon(MdiIcons.cellphoneAndroid,color: ThemeService.primaryColor,),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: ThemeService.Scolor,
                                //color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: ThemeService.primaryColor, //C40F18
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: Get.width * 0.01,
                        top: Get.height * 0.006,
                        //alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            MdiIcons.calendar,
                            color: ThemeService.primaryColor,
                            size: 35,
                          ),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    1800), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2050));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              controller.dateinput.value.text =
                                  formattedDate; //set output date to TextField value.

                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  ///Marital status
                  dropDwonWidget(
                    list: controller.maritalList.value,
                    selectedValue: controller.selectedMarital,
                    selectedId: controller.selectedMaritalId,
                    emptyTitle: "Select MaritalStatus",
                    isExpanded: controller.isMaritalExpanded,
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    child: TextFormField(
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
                      // onSaved: (e!) => mobileNumber = e!,
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
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
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
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Sakhe',
                        labelText: "Sakhe",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
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
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Village',
                        labelText: "Village",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.hobbyController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Hobby is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Hobby',
                        labelText: "Hobby",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.remarkController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Remark is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Remark',
                        labelText: "Remark",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.number,
                      controller: controller.heightController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Hight is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Please Enter Hight In Feet & Inch(5.5)',
                        labelText: "Hight",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.number,
                      controller: controller.weightController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Weight is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Weight',
                        labelText: "Weight",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///Education
                  dropDwonWidget(
                    list: controller.educationList.value,
                    selectedValue: controller.selectedEducation,
                    selectedId: controller.selectedEducationId,
                    emptyTitle: "Select Education",
                    isExpanded: controller.isEducationExpanded,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ///Occupation
                  dropDwonWidget(
                    list: controller.occupationList.value,
                    selectedValue: controller.selectedOccupation,
                    selectedId: controller.selectedOccupationId,
                    emptyTitle: "Select Occupation",
                    isExpanded: controller.isOccupationExpanded,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.number,
                      controller: controller.monthlyIncomeController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Monthly Income is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Monthly Income',
                        labelText: "Monthly Income",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
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
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Address',
                        labelText: "Address",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  if (controller.step1Loading.value == false)
                    GestureDetector(
                      onTap: () async{
                        controller.step1Loading.value = true;
                        await Future.delayed(const Duration(milliseconds: 500));
                        if(await controller.key.currentState!.validate()){

                          controller.step1Loading.value = false;
                          if(controller.selectedFile.value == null) {
                            controller.step1Loading.value = false;

                            await Fluttertoast.showToast(
                                msg: "Please select Image",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);

                          }
                          else if (controller.selectedGender.value.isEmpty) {
                            controller.step1Loading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Gender",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          }
                          else if (controller.selectedEducation.value.isEmpty){
                            controller.step1Loading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Education",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if (controller.selectedEducation.value.isEmpty){
                            controller.step1Loading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Education",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if (controller.selectedMarital.value.isEmpty){
                            controller.step1Loading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Marital status",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if (controller.selectedOccupation.value.isEmpty){
                            controller.step1Loading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Occupation",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else{
                            controller.step1Loading.value = false;
                            bool isLastStep = (controller.currentStep.value == - 1);
                            if (isLastStep) {
                              //Do something with this information
                            } else {
                              controller.currentStep += 1;
                            }
                          }
                        }
                        // if (controller.key.currentState!.validate()){
                        //   controller.step1Loading.value = false;
                        //   controller.key.currentState!.save();
                        //   if(controller.selectedFile.value == null){
                        //     controller.step1Loading.value = false;
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Image",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.CENTER,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.red,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //   }
                        //   else if (controller.selectedGender.value.isEmpty) {
                        //     controller.step1Loading.value = false;
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Gender",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.CENTER,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.red,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //     return;
                        //   }
                        //   else if (controller.selectedEducation.value.isEmpty){
                        //     controller.step1Loading.value = false;
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Education",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.CENTER,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.red,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //   }
                        //   else if (controller.selectedEducation.value.isEmpty){
                        //     controller.step1Loading.value = false;
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Education",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.CENTER,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.red,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //   }
                        //   else if (controller.selectedMarital.value.isEmpty){
                        //     controller.step1Loading.value = false;
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Marital status",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.CENTER,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.red,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //   }
                        //   else if (controller.selectedOccupation.value.isEmpty){
                        //     controller.step1Loading.value = false;
                        //     Fluttertoast.showToast(
                        //         msg: "Please select Occupation",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.CENTER,
                        //         timeInSecForIosWeb: 1,
                        //         backgroundColor: Colors.red,
                        //         textColor: Colors.white,
                        //         fontSize: 16.0);
                        //   }
                        //   else{
                        //     controller.step1Loading.value = false;
                        //     bool isLastStep = (controller.currentStep.value ==
                        //         stepper(context).length - 1);
                        //     if (isLastStep) {
                        //       //Do something with this information
                        //     } else {
                        //       controller.currentStep += 1;
                        //     }
                        //   }
                        // }
                        else{
                          controller.step1Loading.value = false;
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
                          child: Text("Next", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                      ),
                    )
                  else CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)),
                ],
              ),
            ),
            isActive: controller.currentStep.value >= 0,
            //state: StepState.complete,
          ),

          Step(
            title: const Flexible(child: Text("Family")),
            content: Form(
              key: controller.key1,
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.fatherNameController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Father Name is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Father Name',
                        labelText: "Father Name",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.fatherOccupationController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Father Occupation is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Father Occupation',
                        labelText: "Father Occupation",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.fatherMobileNumberController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Father Mobile Number is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Father Mobile Number',
                        labelText: "Father Mobile Number",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.number,
                      controller: controller.fatherIncomeController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Father Income is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Father Income',
                        labelText: "Father Income",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.motherNameController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Mother Name is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Mother Name',
                        labelText: "Mother Name",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.motherOccupationController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Mother Occupation is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Mother Occupation',
                        labelText: "Mother Occupation",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  controller.step2Loading.value ?
                  CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor))
                      : GestureDetector(
                    onTap: ()async{
                      controller.step2Loading.value = true;
                      if (controller.key1.currentState!.validate()) {
                        controller.step2Loading.value = false;
                        bool isLastStep = (controller.currentStep.value ==
                             - 1);
                        if (isLastStep) {
                          //Do something with this information
                        } else {
                          controller.currentStep += 1;
                        }

                      }else{
                        controller.step2Loading.value = false;
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
                        child: Text("Next", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isActive: controller.currentStep.value >= 1,
            state: StepState.disabled,
          ),

          Step(
            title: const Flexible(child: Text("Other")),
            content: Form(
              key: controller.key2,
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.number,
                      controller: controller.numberOfBrotherController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Number Of Brother is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Number Of Brother',
                        labelText: "Number Of Brother",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.number,
                      controller: controller.numberOfSisterController.value,
                      // validator: (e!) {
                      //   if (e!.isEmpty) {
                      //     return "Number Of Sister is Required";
                      //   }
                      //   return null;
                      // },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Number Of Sister',
                        labelText: "Number Of Sister",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.mosalController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Mosal is Required";
                        }
                        return null;
                      },
                      // onSaved: (e!) => familyMemberName = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Mosal',
                        labelText: "Mosal",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.Scolor,
                            //color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: ThemeService.primaryColor, //C40F18
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  controller.step3Loading.value ?
                  CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor))
                      : GestureDetector(
                    onTap: () {
                      controller.step3Loading.value = true;
                      if (controller.key2.currentState!.validate()) {
                        controller.step3Loading.value = false;

                      }else{
                        controller.step3Loading.value = false;
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
                        child: Text("Register", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isActive: controller.currentStep.value >= 2,
            state: StepState.disabled,
          ),

        ],
        controlsBuilder: (context, controller) {
          return const SizedBox.shrink();
        },
        physics: const BouncingScrollPhysics(),
        currentStep: controller.currentStep.value,
        onStepTapped: (step){
          controller.currentStep.value = step;
        },
        onStepContinue: () {
          bool isLastStep = (controller.currentStep.value == - 1);
          if (isLastStep) {
            //Do something with this information
          } else {
            controller.currentStep += 1;
          }
        },
        onStepCancel: () => controller.currentStep.value == 0
            ? null
            : controller.currentStep -= 1,
      ),
    ));
  }

  // List<Step> stepper(context) {
  //   final screenSize = Get.size;
  //  return  <Step>[
  //     Step(
  //       title: const Flexible(child: Text("Personal")),
  //       content:Column(
  //         children: [
  //           InkWell(
  //               onTap: () {
  //                 controller.pickFile();
  //                 // _showPicker(context);
  //               },
  //               child: controller.selectedFile.value == null
  //                   ? Container(
  //                 width: Get.width * 0.30,
  //                 height: Get.width * 0.30,
  //                     child: CircleAvatar(
  //                 radius: 62,
  //                 backgroundColor: ThemeService.primaryColor,
  //                 child: CircleAvatar(
  //                     radius: 60,
  //                     backgroundColor: Colors.white,
  //                     child: CircleAvatar(
  //                       radius: 50,
  //                       backgroundColor: ThemeService.primaryColor,
  //                       child: Image.asset(
  //                         "assets/icon/ic_camera.png",
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                 ),
  //               ),
  //                   )
  //                   : Container(
  //                 width: Get.width * 0.30,
  //                 height: Get.width * 0.30,
  //                 decoration: BoxDecoration(
  //                   color: ThemeService.white,
  //                   //shape: BoxShape.circle,
  //                   borderRadius: BorderRadius.circular(AppSpacings.s100),
  //                   border: Border.all(color: ThemeService.primaryColor,width:2),
  //                 ),
  //                 child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(62),
  //                     child: Image.file(controller.selectedFile.value!,
  //                       fit: BoxFit.cover,
  //                     )
  //                 ),
  //               )
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.nameController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Member Name is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Member Name',
  //                 labelText: "Member Name",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide:  BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           ///Gender
  //           dropDwonWidget(
  //             list: controller.genderList.value,
  //             selectedValue: controller.selectedGender,
  //             selectedId: controller.selectedGenderId,
  //             emptyTitle: "Select Gender",
  //             isExpanded: controller.isGenderExpanded,
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Stack(
  //             children: [
  //               Container(
  //                 child: TextFormField(
  //                   style: GoogleFonts.aBeeZee(),
  //                   cursorColor: ThemeService.primaryColor,
  //                   keyboardType: TextInputType.datetime,
  //                   controller: controller.dateinput.value,
  //                   validator: (e) {
  //                     if (e!.isEmpty) {
  //                       return "Birth Date is Required";
  //                     }
  //                     return null;
  //                   },
  //                   onSaved: (value) {
  //                     controller.birthDate = DateTime.parse(value!);
  //                   },
  //                   decoration: InputDecoration(
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(15)),
  //                     hintText: 'Birth Date',
  //                     labelText: "Birth Date",
  //                     labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                     errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                     // prefixIcon: Icon(MdiIcons.cellphoneAndroid,color: ThemeService.primaryColor,),
  //                     focusedBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(15.0),
  //                       borderSide: BorderSide(
  //                         color: ThemeService.Scolor,
  //                         //color: Colors.black,
  //                       ),
  //                     ),
  //                     enabledBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(15.0),
  //                       borderSide: const BorderSide(
  //                         color: ThemeService.primaryColor, //C40F18
  //                         width: 1.0,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Positioned(
  //                 right: screenSize.width * 0.01,
  //                 top: screenSize.height * 0.006,
  //                 //alignment: Alignment.topRight,
  //                 child: IconButton(
  //                   icon: Icon(
  //                     MdiIcons.calendar,
  //                     color: ThemeService.primaryColor,
  //                     size: 35,
  //                   ),
  //                   onPressed: () async {
  //                     DateTime? pickedDate = await showDatePicker(
  //                         context: context,
  //                         initialDate: DateTime.now(),
  //                         firstDate: DateTime(
  //                             1800), //DateTime.now() - not to allow to choose before today.
  //                         lastDate: DateTime(2050));
  //
  //                     if (pickedDate != null) {
  //                       print(
  //                           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
  //                       String formattedDate =
  //                       DateFormat('yyyy-MM-dd').format(pickedDate);
  //                       print(
  //                           formattedDate); //formatted date output using intl package =>  2021-03-16
  //                       //you can implement different kind of Date Format here according to your requirement
  //
  //                       controller.dateinput.value.text =
  //                           formattedDate; //set output date to TextField value.
  //
  //                     } else {
  //                       print("Date is not selected");
  //                     }
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 10.0,),
  //           ///Marital status
  //           dropDwonWidget(
  //             list: controller.maritalList.value,
  //             selectedValue: controller.selectedMarital,
  //             selectedId: controller.selectedMaritalId,
  //             emptyTitle: "Select MaritalStatus",
  //             isExpanded: controller.isMaritalExpanded,
  //           ),
  //           const SizedBox(height: 10.0,),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.phone,
  //               controller: controller.mobileNumberController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Mobile Number is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => mobileNumber = e!,
  //               inputFormatters: [
  //                 // new WhitelistingTextInputFormatter(
  //                 //     new RegExp(r'^[0-9]*$')),
  //                 new LengthLimitingTextInputFormatter(10),
  //               ],
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Mobile Number',
  //                 labelText: "Mobile Number",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.sakheController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Sakhe is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Sakhe',
  //                 labelText: "Sakhe",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.villageController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Village is Required";
  //                 }
  //                 return null;
  //               },
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Village',
  //                 labelText: "Village",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.hobbyController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Hobby is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Hobby',
  //                 labelText: "Hobby",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.remarkController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Remark is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Remark',
  //                 labelText: "Remark",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.number,
  //               controller: controller.heightController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Hight is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Please Enter Hight In Feet & Inch(5.5)',
  //                 labelText: "Hight",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.number,
  //               controller: controller.weightController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Weight is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Weight',
  //                 labelText: "Weight",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           ///Education
  //           dropDwonWidget(
  //             list: controller.educationList.value,
  //             selectedValue: controller.selectedEducation,
  //             selectedId: controller.selectedEducationId,
  //             emptyTitle: "Select Education",
  //             isExpanded: controller.isEducationExpanded,
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           ///Occupation
  //           dropDwonWidget(
  //             list: controller.occupationList.value,
  //             selectedValue: controller.selectedOccupation,
  //             selectedId: controller.selectedOccupationId,
  //             emptyTitle: "Select Occupation",
  //             isExpanded: controller.isOccupationExpanded,
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.number,
  //               controller: controller.monthlyIncomeController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Monthly Income is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Monthly Income',
  //                 labelText: "Monthly Income",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.addressController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Address is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Address',
  //                 labelText: "Address",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 15.0,
  //           ),
  //           if (controller.step1Loading.value == false)
  //           GestureDetector(
  //             onTap: () async{
  //               controller.step1Loading.value = true;
  //               await Future.delayed(const Duration(milliseconds: 500));
  //               if(await controller.key.currentState!.validate()){
  //
  //                 controller.step1Loading.value = false;
  //                 if(controller.selectedFile.value == null) {
  //                   controller.step1Loading.value = false;
  //
  //                  await Fluttertoast.showToast(
  //                       msg: "Please select Image",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //
  //                 }
  //                 else if (controller.selectedGender.value.isEmpty) {
  //                   controller.step1Loading.value = false;
  //                   Fluttertoast.showToast(
  //                       msg: "Please select Gender",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                   return;
  //                 }
  //                 else if (controller.selectedEducation.value.isEmpty){
  //                   controller.step1Loading.value = false;
  //                   Fluttertoast.showToast(
  //                       msg: "Please select Education",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 }
  //                 else if (controller.selectedEducation.value.isEmpty){
  //                   controller.step1Loading.value = false;
  //                   Fluttertoast.showToast(
  //                       msg: "Please select Education",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 }
  //                 else if (controller.selectedMarital.value.isEmpty){
  //                   controller.step1Loading.value = false;
  //                   Fluttertoast.showToast(
  //                       msg: "Please select Marital status",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 }
  //                 else if (controller.selectedOccupation.value.isEmpty){
  //                   controller.step1Loading.value = false;
  //                   Fluttertoast.showToast(
  //                       msg: "Please select Occupation",
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.CENTER,
  //                       timeInSecForIosWeb: 1,
  //                       backgroundColor: Colors.red,
  //                       textColor: Colors.white,
  //                       fontSize: 16.0);
  //                 }
  //                 else{
  //                   controller.step1Loading.value = false;
  //                   bool isLastStep = (controller.currentStep.value ==
  //                       stepper(context).length - 1);
  //                   if (isLastStep) {
  //                     //Do something with this information
  //                   } else {
  //                     controller.currentStep += 1;
  //                   }
  //                 }
  //               }
  //               // if (controller.key.currentState!.validate()){
  //               //   controller.step1Loading.value = false;
  //               //   controller.key.currentState!.save();
  //               //   if(controller.selectedFile.value == null){
  //               //     controller.step1Loading.value = false;
  //               //     Fluttertoast.showToast(
  //               //         msg: "Please select Image",
  //               //         toastLength: Toast.LENGTH_SHORT,
  //               //         gravity: ToastGravity.CENTER,
  //               //         timeInSecForIosWeb: 1,
  //               //         backgroundColor: Colors.red,
  //               //         textColor: Colors.white,
  //               //         fontSize: 16.0);
  //               //   }
  //               //   else if (controller.selectedGender.value.isEmpty) {
  //               //     controller.step1Loading.value = false;
  //               //     Fluttertoast.showToast(
  //               //         msg: "Please select Gender",
  //               //         toastLength: Toast.LENGTH_SHORT,
  //               //         gravity: ToastGravity.CENTER,
  //               //         timeInSecForIosWeb: 1,
  //               //         backgroundColor: Colors.red,
  //               //         textColor: Colors.white,
  //               //         fontSize: 16.0);
  //               //     return;
  //               //   }
  //               //   else if (controller.selectedEducation.value.isEmpty){
  //               //     controller.step1Loading.value = false;
  //               //     Fluttertoast.showToast(
  //               //         msg: "Please select Education",
  //               //         toastLength: Toast.LENGTH_SHORT,
  //               //         gravity: ToastGravity.CENTER,
  //               //         timeInSecForIosWeb: 1,
  //               //         backgroundColor: Colors.red,
  //               //         textColor: Colors.white,
  //               //         fontSize: 16.0);
  //               //   }
  //               //   else if (controller.selectedEducation.value.isEmpty){
  //               //     controller.step1Loading.value = false;
  //               //     Fluttertoast.showToast(
  //               //         msg: "Please select Education",
  //               //         toastLength: Toast.LENGTH_SHORT,
  //               //         gravity: ToastGravity.CENTER,
  //               //         timeInSecForIosWeb: 1,
  //               //         backgroundColor: Colors.red,
  //               //         textColor: Colors.white,
  //               //         fontSize: 16.0);
  //               //   }
  //               //   else if (controller.selectedMarital.value.isEmpty){
  //               //     controller.step1Loading.value = false;
  //               //     Fluttertoast.showToast(
  //               //         msg: "Please select Marital status",
  //               //         toastLength: Toast.LENGTH_SHORT,
  //               //         gravity: ToastGravity.CENTER,
  //               //         timeInSecForIosWeb: 1,
  //               //         backgroundColor: Colors.red,
  //               //         textColor: Colors.white,
  //               //         fontSize: 16.0);
  //               //   }
  //               //   else if (controller.selectedOccupation.value.isEmpty){
  //               //     controller.step1Loading.value = false;
  //               //     Fluttertoast.showToast(
  //               //         msg: "Please select Occupation",
  //               //         toastLength: Toast.LENGTH_SHORT,
  //               //         gravity: ToastGravity.CENTER,
  //               //         timeInSecForIosWeb: 1,
  //               //         backgroundColor: Colors.red,
  //               //         textColor: Colors.white,
  //               //         fontSize: 16.0);
  //               //   }
  //               //   else{
  //               //     controller.step1Loading.value = false;
  //               //     bool isLastStep = (controller.currentStep.value ==
  //               //         stepper(context).length - 1);
  //               //     if (isLastStep) {
  //               //       //Do something with this information
  //               //     } else {
  //               //       controller.currentStep += 1;
  //               //     }
  //               //   }
  //               // }
  //               else{
  //                 controller.step1Loading.value = false;
  //               }
  //
  //             },
  //             child: Container(
  //               height: 55.0,
  //               decoration:  BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 gradient: LinearGradient(
  //                   colors: [
  //                     ThemeService.primaryColor,
  //                     ThemeService.grayScale,
  //                   ],
  //                   begin: const FractionalOffset(0.0, 0.0),
  //                   end: const FractionalOffset(1.0, 0.0),
  //                   stops: [0.0, 1.0],
  //                   tileMode: TileMode.clamp,
  //                 ),
  //               ),
  //               child: Center(
  //                 child: Text("Next", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
  //               ),
  //             ),
  //           )
  //         else CircularProgressIndicator(
  //           backgroundColor: Colors.white,
  //           valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)),
  //         ],
  //       ),
  //       isActive: controller.currentStep.value >= 0,
  //       //state: StepState.complete,
  //     ),
  //
  //
  //     Step(
  //       title: const Flexible(child: Text("Family")),
  //       content: Column(
  //         children: [
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.fatherNameController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Father Name is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Father Name',
  //                 labelText: "Father Name",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.fatherOccupationController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Father Occupation is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Father Occupation',
  //                 labelText: "Father Occupation",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.fatherMobileNumberController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Father Mobile Number is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Father Mobile Number',
  //                 labelText: "Father Mobile Number",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.number,
  //               controller: controller.fatherIncomeController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Father Income is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Father Income',
  //                 labelText: "Father Income",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.motherNameController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Mother Name is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Mother Name',
  //                 labelText: "Mother Name",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.motherOccupationController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Mother Occupation is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Mother Occupation',
  //                 labelText: "Mother Occupation",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 15.0,
  //           ),
  //           controller.step2Loading.value ?
  //           CircularProgressIndicator(
  //               backgroundColor: Colors.white,
  //               valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor))
  //               : GestureDetector(
  //             onTap: ()async{
  //               controller.step2Loading.value = true;
  //               if (controller.key.currentState!.validate()) {
  //                 controller.step2Loading.value = false;
  //                   bool isLastStep = (controller.currentStep.value ==
  //                       stepper(context).length - 1);
  //                   if (isLastStep) {
  //                     //Do something with this information
  //                   } else {
  //                     controller.currentStep += 1;
  //                   }
  //
  //               }else{
  //                 controller.step2Loading.value = false;
  //               }
  //             },
  //             child: Container(
  //               height: 55.0,
  //               decoration:  BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 gradient: LinearGradient(
  //                   colors: [
  //                     ThemeService.primaryColor,
  //                     ThemeService.grayScale,
  //                   ],
  //                   begin: const FractionalOffset(0.0, 0.0),
  //                   end: const FractionalOffset(1.0, 0.0),
  //                   stops: [0.0, 1.0],
  //                   tileMode: TileMode.clamp,
  //                 ),
  //               ),
  //               child: Center(
  //                 child: Text("Next", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       isActive: controller.currentStep.value >= 1,
  //       state: StepState.disabled,
  //     ),
  //
  //     Step(
  //       title: const Flexible(child: Text("Other")),
  //       content: Column(
  //         children: [
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.number,
  //               controller: controller.numberOfBrotherController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Number Of Brother is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Number Of Brother',
  //                 labelText: "Number Of Brother",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.number,
  //               controller: controller.numberOfSisterController.value,
  //               // validator: (e!) {
  //               //   if (e!.isEmpty) {
  //               //     return "Number Of Sister is Required";
  //               //   }
  //               //   return null;
  //               // },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Number Of Sister',
  //                 labelText: "Number Of Sister",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Container(
  //             child: TextFormField(
  //               style: GoogleFonts.aBeeZee(),
  //               cursorColor: ThemeService.primaryColor,
  //               keyboardType: TextInputType.text,
  //               controller: controller.mosalController.value,
  //               validator: (e) {
  //                 if (e!.isEmpty) {
  //                   return "Mosal is Required";
  //                 }
  //                 return null;
  //               },
  //               // onSaved: (e!) => familyMemberName = e!,
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 hintText: 'Mosal',
  //                 labelText: "Mosal",
  //                 labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
  //                 errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
  //                 // prefixIcon: Icon(MdiIcons.accountCircle,color: ThemeService.primaryColor,),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.Scolor,
  //                     //color: Colors.black,
  //                   ),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                   borderSide: const BorderSide(
  //                     color: ThemeService.primaryColor, //C40F18
  //                     width: 1.0,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           controller.step3Loading.value ?
  //           CircularProgressIndicator(
  //               backgroundColor: Colors.white,
  //               valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor))
  //               : GestureDetector(
  //             onTap: () {
  //               controller.step3Loading.value = true;
  //               if (controller.key.currentState!.validate()) {
  //                 controller.step3Loading.value = false;
  //
  //               }
  //             },
  //             child: Container(
  //               height: 55.0,
  //               decoration:  BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 gradient: LinearGradient(
  //                   colors: [
  //                     ThemeService.primaryColor,
  //                     ThemeService.grayScale,
  //                   ],
  //                   begin: const FractionalOffset(0.0, 0.0),
  //                   end: const FractionalOffset(1.0, 0.0),
  //                   stops: [0.0, 1.0],
  //                   tileMode: TileMode.clamp,
  //                 ),
  //               ),
  //               child: Center(
  //                 child: Text("Next", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       isActive: controller.currentStep.value >= 2,
  //       state: StepState.disabled,
  //     ),
  //   ];
  //
  // }
}


