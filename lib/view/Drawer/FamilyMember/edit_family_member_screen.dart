import 'package:community_app/common/api_provider.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../common/widget/simpledropdown.dart';
import '../../../controllers/FamilyMemberController/edit_familymember_controller.dart';


class EditFamilyMemberScreen extends GetView<EditFamilyMemberController> {
  const EditFamilyMemberScreen({Key? key}) : super(key: key);

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
          "Edit Family Member",
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
                children: [
                  // InkWell(
                  //     onTap: () {
                  //       controller.pickFile();
                  //       // _showPicker(context);
                  //     },
                  //     child: controller.selectedFile.value == null
                  //         ? CircleAvatar(
                  //       radius: 62,
                  //       backgroundColor: ThemeService.primaryColor,
                  //       child: CircleAvatar(
                  //         radius: 60,
                  //         backgroundColor: Colors.white,
                  //         child: CircleAvatar(
                  //           radius: 50,
                  //           backgroundColor: ThemeService.primaryColor,
                  //           child: Image.asset(
                  //             "assets/icon/ic_camera.png",
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //         : Container(
                  //       width: Get.width * 0.30,
                  //       height: Get.width * 0.30,
                  //       decoration: BoxDecoration(
                  //         color: ThemeService.white,
                  //         //shape: BoxShape.circle,
                  //         borderRadius: BorderRadius.circular(AppSpacings.s100),
                  //         border: Border.all(color: ThemeService.primaryColor,width:2),
                  //       ),
                  //       child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(62),
                  //           child: Image.file(controller.selectedFile.value!,
                  //             fit: BoxFit.cover,
                  //           )
                  //       ),
                  //     )
                  //
                  // ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.text,
                      controller: controller.familymemberNameController.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Family Member Name is Required";
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
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
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
                  ),
                  SizedBox(
                    height: 15.0,
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
                      // onSaved: (e!) => address = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Address',
                        labelText: "Addresss",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: TextFormField(
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
                      // onSaved: (e!) => area = e!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Area',
                        labelText: "Area",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ///Gender
                  dropDwonWidget(
                    list: controller.genderList.value,
                    selectedValue: controller.selectedGender,
                    selectedId: controller.selectedGenderId,
                    emptyTitle: "Select Gender",
                    isExpanded: controller.isGenderExpanded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ///Relation
                  dropDwonWidget(
                    list: controller.relationList.value,
                    selectedValue: controller.selectedRelation,
                    selectedId: controller.selectedRelationId,
                    emptyTitle: "Select Relation",
                    isExpanded: controller.isRelationExpanded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
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
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.phone,
                      controller: controller.whatsappNumberController.value,
                      inputFormatters: [
                        // new WhitelistingTextInputFormatter(
                        //     new RegExp(r'^[0-9]*$')),
                        new LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Whatsapp Number',
                        labelText: "Whatsapp Number",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Stack(
                    children: [
                      Container(
                        child: TextFormField(
                          style: GoogleFonts.aBeeZee(),
                          readOnly: true,
                          cursorColor: ThemeService.primaryColor,
                          keyboardType: TextInputType.datetime,
                          controller: controller.dateinput.value,
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Birth Date is Required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Birth Date',
                            labelText: "Birth Date *",
                            labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                            errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                            // prefixIcon: Icon(MdiIcons.cellphoneAndroid,color: Mcolor,),
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
                      ),
                      Positioned(
                        right: Get.width * 0.01,
                        top: Get.height * 0.006,
                        //alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            MdiIcons.calendar,
                            color:
                            ThemeService.primaryColor,
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
                              print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              controller.dateinput.value.text = formattedDate;
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              // _dateinput.text = formattedDate; //set output date to TextField value.

                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: TextFormField(
                      style: GoogleFonts.aBeeZee(),
                      cursorColor: ThemeService.primaryColor,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Email',
                        labelText: "Email",
                        labelStyle: GoogleFonts.aBeeZee(color: ThemeService.primaryColor),
                        errorStyle: GoogleFonts.aBeeZee(color: Colors.red),
                        // prefixIcon: Icon(MdiIcons.accountCircle,color: Mcolor,),
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
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ///Education
                  dropDwonWidget(
                    list: controller.educationList.value,
                    selectedValue: controller.selectedEducation,
                    selectedId: controller.selectedEducationId,
                    emptyTitle: "Select Education",
                    isExpanded: controller.isEducationExpanded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ///Marital Status
                  dropDwonWidget(
                    list: controller.maritalList.value,
                    selectedValue: controller.selectedMarital,
                    selectedId: controller.selectedMaritalId,
                    emptyTitle: "Select MaritalStatus",
                    isExpanded: controller.isMaritalExpanded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ///Occupation
                  dropDwonWidget(
                    list: controller.occupationList.value,
                    selectedValue: controller.selectedOccupation,
                    selectedId: controller.selectedOccupationId,
                    emptyTitle: "Select Occupation",
                    isExpanded: controller.isOccupationExpanded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ///Blood Group
                  dropDwonWidget(
                    list: controller.bloodGroupList.value,
                    selectedValue: controller.selectedBloodGroup,
                    selectedId: controller.selectedBloodGroupId,
                    emptyTitle: "Select Blood Group",
                    isExpanded: controller.isBloodGroupExpanded,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  if (controller.isLoading.value == false)
                    GestureDetector(
                      onTap: () {
                        if (controller.key.currentState!.validate()) {
                          controller.isLoading.value = true;
                          controller.key.currentState!.save();
                          if(controller.selectedEducation.isEmpty){
                            controller.isLoading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Education",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if(controller.selectedMarital.isEmpty){
                            controller.isLoading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select MaritalStatus",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if(controller.selectedOccupation.isEmpty){
                            controller.isLoading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select Occupation",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if(controller.selectedBloodGroup.isEmpty){
                            controller.isLoading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select BloodGroup",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else{
                            controller.UpdateFamilyMember();
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
                          child: Text("Update Member", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
                        ),
                      ),
                    )
                  else CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(ThemeService.primaryColor)),
                ],),
            ),
          ),
        ),
      ),
    ));
  }
}


