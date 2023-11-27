import 'package:community_app/binders/Notification_Binder/edu_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/good_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/gov_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/ohter_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/sad_news_binder.dart';
import 'package:community_app/binders/add_member_binder.dart';
import 'package:community_app/binders/auth_binder.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/widget/auth_widget.dart';
import 'package:community_app/view/Member/add_member.dart';
import 'package:community_app/view/Notification/education_news_screen.dart';
import 'package:community_app/view/Notification/good_news_screen.dart';
import 'package:community_app/view/Notification/gov_news_screen.dart';
import 'package:community_app/view/Notification/other_news_screen.dart';
import 'package:community_app/view/Notification/sad_news_screen.dart';
import 'package:get/get.dart';

class PageRoutes {
  static const initial = Routes.root;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.root,
      page: () => AuthWidget(),
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

  ];
}
