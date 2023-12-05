import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/widget/simpledropdown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/themeService.dart';
import '../../../controllers/Request_controller/add_request_controller.dart';


class AddRequestScreen extends GetView<AddRequestController> {
  const AddRequestScreen({Key? key}) : super(key: key);

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
          "Add Request",
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
                    cursorColor: ThemeService.primaryColor,
                    keyboardType: TextInputType.multiline,
                    controller: controller.aboutRequest.value,
                    maxLines: 10,
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "About Request is Required";
                      }else if(e.length <= 20){
                        return "Write At least 20 charachter";
                      }
                    },
                    // onSaved: (e) => aboutDonation = e,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'About Request',
                      labelText: "About Request",
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
                  dropDwonWidget(
                    list: controller.RequestTypeList,
                    selectedValue: controller.selectedRequestType,
                    selectedId: controller.selectedRequestTypeId,
                    emptyTitle: "Select Request Type",
                    isExpanded: controller.isRequestTypeExpanded,
                  ),

                  // Container(
                  //   width: Get.width * 0.910,
                  //   height: Get.height * 0.072,
                  //   padding: EdgeInsets.only(left: 15, right: 22),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: ThemeService.primaryColor),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: Center(
                  //     child: DropdownButtonFormField(
                  //       icon: Icon(                // Add this
                  //         FeatherIcons.chevronDown,  // Add this
                  //         color: ThemeService.primaryColor,   // Add this
                  //       ),
                  //       decoration: InputDecoration(
                  //           enabledBorder: UnderlineInputBorder(
                  //             borderSide: BorderSide(color: ThemeService.white),
                  //           )),
                  //       elevation: 5,
                  //       hint: Text(
                  //         'Select Notification Type',
                  //         style: GoogleFonts.aBeeZee(
                  //           color: ThemeService.primaryColor,
                  //           letterSpacing: 0.2,
                  //         ),
                  //       ), // Not necessary for Option 1
                  //       //value: controller.selectedValue.value.toString(),
                  //       validator: (newValue) {
                  //         if (newValue == null) {
                  //           return 'Notification Type is required';
                  //         }
                  //       },
                  //       items: controller.NotificationItemList.map(
                  //             (item) {
                  //           return DropdownMenuItem(
                  //             child: Text(item.text.toString()),
                  //             value: item.value.toString(),
                  //           );
                  //         },
                  //       ).toList(),
                  //       onChanged: (value) {
                  //         controller.selectedValue.value = value!;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: screenSize.width * 0.895,
                  //   height: screenSize.height * 0.078,
                  //   padding: EdgeInsets.only(left: 15, right: 22),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Mcolor),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButtonFormField(
                  //       icon: Icon(                // Add this
                  //         FeatherIcons.chevronDown,  // Add this
                  //         color: Mcolor,   // Add this
                  //       ),
                  //       isExpanded: true,
                  //       value: selectedvalue,
                  //       hint: Text("Select Notification Type *",style: GoogleFonts.aBeeZee(color: Mcolor),),
                  //       items: NotificationItemlist.map(
                  //             (note) {
                  //           return DropdownMenuItem(
                  //             child: Text(note['text']),
                  //             value: note['value'].toString(),
                  //           );
                  //         },
                  //       ).toList(),
                  //       onChanged: (value) {
                  //         setState(() {
                  //           selectedvalue = value;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 15.0,
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
                          }else if(controller.selectedRequestType.isEmpty){
                            controller.isLoading.value = false;
                            Fluttertoast.showToast(
                                msg: "Please select RequestType",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else{
                            controller.addRequest();
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
                          child: Text("Add Request", style: GoogleFonts.aBeeZee(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
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


