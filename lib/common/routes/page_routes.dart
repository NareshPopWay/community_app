import 'package:community_app/binders/Business_Binders/business_binder.dart';
import 'package:community_app/binders/Donation_Binders/add_donation_binder.dart';
import 'package:community_app/binders/Donation_Binders/donation_detail_binder.dart';
import 'package:community_app/binders/FamilyMemberController/edit_family_member_binder.dart';
import 'package:community_app/binders/FeedBack/add_feedback_binder.dart';
import 'package:community_app/binders/FeedBack/feedback_binder.dart';
import 'package:community_app/binders/Marksheet_Binders/marksheet_binder.dart';
import 'package:community_app/binders/Notification_Binder/add_notification_binder.dart';
import 'package:community_app/binders/Notification_Binder/edu_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/good_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/gov_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/member_detail_binder.dart';
import 'package:community_app/binders/Notification_Binder/ohter_news_binder.dart';
import 'package:community_app/binders/Notification_Binder/sad_news_binder.dart';
import 'package:community_app/binders/RequestBinder/other_request_binder.dart';
import 'package:community_app/binders/RequestBinder/request_binder.dart';
import 'package:community_app/binders/RequestBinder/request_detail_binder.dart';
import 'package:community_app/binders/FamilyMemberController/add_family_member_binder.dart';
import 'package:community_app/binders/add_member_binder.dart';
import 'package:community_app/binders/auth_binder.dart';
import 'package:community_app/binders/marriage_Binders/add_marriage_binder.dart';
import 'package:community_app/binders/marriage_Binders/marriage_binder.dart';
import 'package:community_app/binders/marriage_Binders/marriage_detail_binder.dart';
import 'package:community_app/common/routes/app_routes.dart';
import 'package:community_app/common/widget/auth_widget.dart';
import 'package:community_app/view/Drawer/Advertisement/add_advertisement.dart';
import 'package:community_app/view/Drawer/Advertisement/advertisement_screen.dart';
import 'package:community_app/view/Drawer/Business/add_business.dart';
import 'package:community_app/view/Drawer/Business/business_screen.dart';
import 'package:community_app/view/Drawer/Donation/add_donation_screen.dart';
import 'package:community_app/view/Drawer/Donation/donation_detail_screen.dart';
import 'package:community_app/view/Drawer/Donation/donation_screen.dart';
import 'package:community_app/view/Drawer/FamilyMember/add_family_member.dart';
import 'package:community_app/view/Drawer/FamilyMember/edit_family_member_screen.dart';
import 'package:community_app/view/Drawer/FamilyMember/family_member_detail_screen.dart';
import 'package:community_app/view/Drawer/FamilyMember/family_member_screen.dart';
import 'package:community_app/view/Drawer/FeedBack/add_feedback.dart';
import 'package:community_app/view/Drawer/FeedBack/feedback_screen.dart';
import 'package:community_app/view/Drawer/Marksheet/marksheet_screen.dart';
import 'package:community_app/view/Drawer/Marriage/add_marriage_screen.dart';
import 'package:community_app/view/Drawer/Marriage/marriage_details_screen.dart';
import 'package:community_app/view/Drawer/Marriage/marriage_screen.dart';
import 'package:community_app/view/Drawer/Request/add_request_screen.dart';
import 'package:community_app/view/Drawer/Request/medical_request_screen.dart';
import 'package:community_app/view/Drawer/Request/other_request.dart';
import 'package:community_app/view/Drawer/Request/request_detail_screen.dart';
import 'package:community_app/view/Drawer/Request/request_screen.dart';
import 'package:community_app/view/Drawer/Request/scholarship_request_screen.dart';
import 'package:community_app/view/Drawer/job/add_job_screen.dart';
import 'package:community_app/view/Drawer/job/job_detail_screen.dart';
import 'package:community_app/view/Drawer/job/job_screen.dart';
import 'package:community_app/view/Member/add_member.dart';
import 'package:community_app/view/Member/member_detail_screen.dart';
import 'package:community_app/view/Notification/add_notification.dart';
import 'package:community_app/view/Notification/education_news_screen.dart';
import 'package:community_app/view/Notification/good_news_screen.dart';
import 'package:community_app/view/Notification/gov_news_screen.dart';
import 'package:community_app/view/Notification/other_news_screen.dart';
import 'package:community_app/view/Notification/sad_news_screen.dart';
import 'package:community_app/view/admin_login_screen.dart';
import 'package:community_app/view/home_screen.dart';
import 'package:community_app/view/login_screen.dart';
import 'package:get/get.dart';

import '../../binders/Advertisement_Binders/add_advertisement_binder.dart';
import '../../binders/Advertisement_Binders/advertisement_binder.dart';
import '../../binders/Advertisement_Binders/advertisement_detail_binder.dart';
import '../../binders/Business_Binders/add_business_binder.dart';
import '../../binders/Donation_Binders/blood_donation_binder.dart';
import '../../binders/Donation_Binders/donation_binder.dart';
import '../../binders/Donation_Binders/money_donation_binder.dart';
import '../../binders/Donation_Binders/organ_donation_binder.dart';
import '../../binders/Donation_Binders/other_donation_binder.dart';
import '../../binders/FamilyMemberController/familymember_detail_binder.dart';
import '../../binders/Job_Binders/add_job_binder.dart';
import '../../binders/Job_Binders/job_binder.dart';
import '../../binders/Job_Binders/job_detail_binder.dart';
import '../../binders/Marksheet_Binders/add_marksheet_binder.dart';
import '../../binders/Notification_Binder/notification_details_binder.dart';
import '../../binders/RequestBinder/add_request_binder.dart';
import '../../binders/RequestBinder/medical_request_binder.dart';
import '../../binders/RequestBinder/scholarship_request_binder.dart';
import '../../binders/FamilyMemberController/family_member_binder.dart';
import '../../view/Drawer/Advertisement/advertisement_detail_screen.dart';
import '../../view/Drawer/Donation/blood_donation_screen.dart';
import '../../view/Drawer/Donation/money_donation_screen.dart';
import '../../view/Drawer/Donation/organ_donation_screen.dart';
import '../../view/Drawer/Donation/other_donation_screen.dart';
import '../../view/Drawer/Marksheet/add_marksheet.dart';
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
      name: Routes.adminLogin,
      page: () => AdminLoginScreen(),
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
      name: Routes.editFamilyMember,
      page: () => EditFamilyMemberScreen(),
      binding: EditFamilyMemberBinder(),
     ),
    GetPage(
      name: Routes.familyMemberDetail,
      page: () => FamilyMemberDetailsScreen(),
      binding: FamilyMemberDetailBinder(),
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

  GetPage(
      name: Routes.addMarriage,
      page: () => AddMarriageScreen(),
      binding: AddMarriageBinder(),
     ),

   GetPage(
      name: Routes.job,
      page: () => JobScreen(),
      binding: JobBinder(),
     ),
    GetPage(
      name: Routes.jobDetails,
      page: () => JobDetailsScreen(),
      binding: JobDetailBinder(),
     ),
   GetPage(
      name: Routes.addJob,
      page: () => AddJobScreen(),
      binding: AddJobBinder(),
     ),

   GetPage(
      name: Routes.business,
      page: () => BusinessScreen(),
      binding: BusinessBinder(),
     ),

  GetPage(
      name: Routes.addBusiness,
      page: () => AddBusinessScreen(),
      binding: AddBusinessBinder(),
     ),
  GetPage(
      name: Routes.advertisement,
      page: () => AdvertisementScreen(),
      binding: AdvertisementBinder(),
     ),
 GetPage(
      name: Routes.advertisementDetails,
      page: () => AdvertisementDetailsScreen(),
      binding: AdvertisementDetailBinder(),
     ),
  GetPage(
      name: Routes.addAdvertisement,
      page: () => AddAdvertisementScreen(),
      binding: AddAdvertisementBinder(),
     ),

 GetPage(
      name: Routes.marksheet,
      page: () => MarksheetScreen(),
      binding: MarksheetBinder(),
     ),

 GetPage(
      name: Routes.addMarksheet,
      page: () => AddMarksheetScreen(),
      binding: AddMarksheetBinder(),
     ),

 GetPage(
      name: Routes.feedBack,
      page: () => FeedBackScreen(),
      binding: FeedBackBinder(),
     ),

    GetPage(
      name: Routes.addFeedBack,
      page: () => AddFeedBackScreen(),
      binding: AddFeedBinder(),
    ),

    GetPage(
      name: Routes.donation,
      page: () => DonationScreen(),
      binding: DonationBinder(),
    ),
    GetPage(
      name: Routes.bloodDonation,
      page: () => BloodDonationScreen(),
      binding: BloodDonationBinder(),
    ),
    GetPage(
      name: Routes.moneyDonation,
      page: () => MoneyDonationScreen(),
      binding: MoneyDonationBinder(),
    ),
    GetPage(
      name: Routes.organDonation,
      page: () => OrganDonationScreen(),
      binding: OrganDonationBinder(),
    ),
    GetPage(
      name: Routes.otherDonation,
      page: () => OtherDonationScreen(),
      binding: OtherDonationBinder(),
    ),
    GetPage(
      name: Routes.donationDetail,
      page: () => DonationDetailScreen(),
      binding: DonationDetailBinder(),
    ),

  GetPage(
      name: Routes.addDonation,
      page: () => AddDonationScreen(),
      binding: AddDonationBinder(),
    ),

    GetPage(
      name: Routes.request,
      page: () => RequestScreen(),
      binding: RequestBinder(),
    ),

    GetPage(
      name: Routes.medicalRequest,
      page: () => MedicalRequestScreen(),
      binding: MedicalRequestBinder(),
    ),

    GetPage(
      name: Routes.scholarshipRequest,
      page: () => ScholarshipRequestScreen(),
      binding: ScholarshipRequestBinder(),
    ),

    GetPage(
      name: Routes.otherRequest,
      page: () => OtherRequestScreen(),
      binding: OtherRequestBinder(),
    ),
   GetPage(
      name: Routes.requestDetail,
      page: () => RequestDetailScreen(),
      binding: RequestDetailBinder(),
    ),
  GetPage(
      name: Routes.addRequest,
      page: () => AddRequestScreen(),
      binding: AddRequestBinder(),
    ),

  ];
}
