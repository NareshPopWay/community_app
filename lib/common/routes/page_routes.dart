import 'package:community_app/binders/add_member_binder.dart';
import 'package:community_app/binders/auth_binder.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/widget/auth_widget.dart';
import 'package:community_app/view/Member/add_member.dart';
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

  ];
}
