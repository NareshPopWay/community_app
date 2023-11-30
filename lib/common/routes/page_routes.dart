import 'package:community_app/binders/Notification_Binder/add_notification_binder.dart';
import 'package:community_app/binders/Notification_Binder/edu_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/good_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/gov_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/member_detail_binder.dart';
import 'package:community_app/binders/Notification_Binder/ohter_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/sad_news_binder.dart';
import 'package:community_app/binders/add_family_member_binder.dart';
import 'package:community_app/binders/add_member_binder.dart';
import 'package:community_app/binders/auth_binder.dart';
import 'package:community_app/binders/marriage_binder.dart';
import 'package:community_app/binders/marriage_detail_binder.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/widget/auth_widget.dart';
import 'package:community_app/controllers/MemberController/member_detail_controller.dart';
import 'package:community_app/view/Drawer/FamilyMember/add_family_member.dart';
import 'package:community_app/view/Drawer/FamilyMember/family_member_screen.dart';
import 'package:community_app/view/Drawer/Marriage/marriage_details_screen.dart';
import 'package:community_app/view/Drawer/Marriage/marriage_screen.dart';
import 'package:community_app/view/Member/add_member.dart';
import 'package:community_app/view/Member/member_detail_screen.dart';
import 'package:community_app/view/Notification/add_notification.dart';
import 'package:community_app/view/Notification/education_news_screen.dart';
import 'package:community_app/view/Notification/good_news_screen.dart';
import 'package:community_app/view/Notification/gov_news_screen.dart';
import 'package:community_app/view/Notification/other_news_screen.dart';
import 'package:community_app/view/Notification/sad_news_screen.dart';
import 'package:community_app/view/home_screen.dart';
import 'package:community_app/view/login_screen.dart';
import 'package:get/get.dart';

import '../../binders/Notification_Binder/notification_details_binder.dart';
import '../../binders/family_member_binder.dart';
import '../../view/Notification/notification_detail_screen.dart';

class PageRoutes {
  static const initial = Routes.root;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.root,
      page: () => AuthWidget(),
      binding: AuthBinder(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: AuthBinder(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: AuthBinder(),
    ),
    GetPage(
      name: Routes.addMember,
      page: () => AddMemberScreen(),
      binding: AddMemberBinder(),
    ),
    GetPage(
      name: Routes.goodNews,
      page: () => GoodNewsScreen(),
      binding: GoodNewsBinder(),
    ),
    GetPage(
      name: Routes.sadNews,
      page: () => SadNewsScreen(),
      binding: SadNewsBinder(),
     ),
    GetPage(
      name: Routes.eduNews,
      page: () => EducationNewsScreen(),
      binding: EducationNewsBinder(),
     ),
    GetPage(
      name: Routes.govNews,
      page: () => GovernmentNewsScreen(),
      binding: GovNewsBinder(),
     ),
    GetPage(
      name: Routes.otherNews,
      page: () => OtherNewsScreen(),
      binding: OtherNewsBinder(),
     ),
    GetPage(
      name: Routes.notificationDetails,
      page: () => NotificationDetailScreen(),
      binding: NotificationDetailsBinder(),
     ),

   GetPage(
      name: Routes.memberDetails,
      page: () => MemberDetailsScreen(),
      binding: MemberDetailsBinder(),
     ),

   GetPage(
      name: Routes.addNotification,
      page: () => AddNotificationScreen(),
      binding: AddNotificationBinder(),
     ),

  GetPage(
      name: Routes.familyMember,
      page: () => FamilyMemberScreen(),
      binding: FamilyMemberBinder(),
     ),
  GetPage(
      name: Routes.marriage,
      page: () => MarriageScreen(),
      binding: MarriageBinder(),
     ),
  GetPage(
      name: Routes.marriageDetail,
      page: () => MarriageDetailsScreen(),
      binding: MarriageDetailsBinder(),
     ),

  GetPage(
      name: Routes.addFamilyMember,
      page: () => AddFamilyMemberScreen(),
      binding: AddFamilyMemberBinder(),
     ),

  ];
}
