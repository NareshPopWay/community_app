// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import '../../../common/api_constant.dart';
// import '../../../common/themeService.dart';
// import '../../../controllers/JobController/job_detail_controller.dart';
// import '../../../controllers/MarkSheetController/marksheet_detail_controller.dart';
//
//
// class MarksheetDetailsScreen extends GetView<MarksheetDetailController> {
//   const MarksheetDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: ThemeService.primaryColor,
//           title: Text(
//             "Marksheet Detail",
//             style: GoogleFonts.aBeeZee(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: (){
//                 Get.back();
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 color: ThemeService.white,
//               ),
//           ),
//         ),
//         body: ListView(
//           shrinkWrap: true,
//           physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top:5.0,left: 5.0,bottom: 5.0,right: 5.0),
//               child:   Container(
//                 height: Get.height * 0.30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       BaseUrl.ImageURL + controller.model!.marksheetImage,
//                     ),
//                     // image: AssetImage(
//                     //   "./assets/logo.png",
//                     // ),
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 // Text(
//                 //   // "Sabhasad Number : ${controller.model!.sabhasadno}",
//                 //   "${controller.model!.familyMemberId}",
//                 //   style: GoogleFonts.aBeeZee(
//                 //       fontSize: 35.0,
//                 //       fontWeight: FontWeight.w900,
//                 //       color: ThemeService.primaryColor),
//                 //   textAlign: TextAlign.end,
//                 // ),
//                 Text(
//                   // "Member Name : \n ${controller.model!.membername}",
//                   "${controller.model!.companyName}",
//                   style: GoogleFonts.aBeeZee(
//                       fontSize: 25.0, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 7.0,
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   elevation: 10,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Job Details :",
//                               style: GoogleFonts.aBeeZee(
//                                   color: ThemeService.primaryColor,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: Get.height * 0.01,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             SizedBox(
//                               width: Get.width * 0.02,
//                             ),
//                             Icon(
//                               FeatherIcons.briefcase,
//                             ),
//                             SizedBox(
//                               width: Get.width * 0.03,
//                             ),
//                             Text(
//                               "${controller.model!.jobFor}",
//                               style: GoogleFonts.aBeeZee(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500),
//                               maxLines: 5,
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: Get.height * 0.01,
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 MdiIcons.currencyInr,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.salary}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 5,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Container(
//                                 child: Expanded(
//                                   child: Text(
//                                     "${controller.model!.jobDetails}",
//                                     style: GoogleFonts.aBeeZee(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w500),
//                                     maxLines: 2,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 FeatherIcons.mapPin,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.jobLocation}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 2,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10.0),
//                               child: Text(
//                                 "Contact Person Details :",
//                                 style: GoogleFonts.aBeeZee(
//                                     color: ThemeService.primaryColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w900),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 FeatherIcons.user,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.memberName}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 5,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 FeatherIcons.phone,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.mobileNumber}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 5,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 MdiIcons.whatsapp,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.whatsappNumber}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 5,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10.0),
//                               child: Text(
//                                 "Company Details :",
//                                 style: GoogleFonts.aBeeZee(
//                                     color: ThemeService.primaryColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w900),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 FeatherIcons.mail,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.email}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 5,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           // thickness: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 FeatherIcons.link2,
//                               ),
//                               SizedBox(
//                                 width: Get.width * 0.03,
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${controller.model!.website}",
//                                   style: GoogleFonts.aBeeZee(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500),
//                                   maxLines: 5,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           height: 2,
//                           color: ThemeService.Scolor,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//     );
//   }
// }
//
//
