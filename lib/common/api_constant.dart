// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class BaseUrl{

  static const String Authorizetoken = 'Authorizetoken';
  // static const String LoginAuthorizetoken = 'LoginAuthorizetoken';
  static const String UserTypeID = 'UserTypeID';

  // Url For Common Path Of API Starting
  static const String comman_string = "http://116.72.10.168:1205/api/";

  // Url Fro Image Display
  static String ImageURL = "http://116.72.10.168:1205/";

  //Url Of API
  static String login = "${comman_string}Admin/Users/authenticate";
  static String GetMember = "${comman_string}Member/GetServerViewList"; // ?page=1&pageCount=1
  static String AddMember = "${comman_string}Member/Save";
  static String SaveMemberImage = "${comman_string}Member/SaveImage";
  static String NotificationType = "${comman_string}Comman/GetList?Id=1";
  static String AddNotification = "${comman_string}Notification/Save";
  static String GetGoodNews = "${comman_string}Notification/GetGoodNews";
  static String GetSadNews = "${comman_string}Notification/GetSadNews";
  static String GetEducationNews = "${comman_string}Notification/GetEducationNews";
  static String GetGovNews = "${comman_string}Notification/GetGovernmentNews";
  static String GetOtherNews = "${comman_string}Notification/GetOtherNews";
  static String SaveNotificationImage = "${comman_string}Notification/SaveImage";
  static String GetFamilyMember = "${comman_string}FamilyMember/GetServerViewList";
  static String AddFamilyMember = "${comman_string}FamilyMember/Save";
  static String SaveFamilyMemberImage = "${comman_string}FamilyMember/SaveImage";
  static String DeleteMember = "${comman_string}FamilyMember/Delete?ID=";
  static String AddToken = "${comman_string}Token/Save";
  static String donnerType = "${comman_string}Comman/GetList?Id=3";
  static String AddDonner = "${comman_string}Donation/Save";
  static String SaveDonnerImage = "${comman_string}Donation/SaveImage";
  static String GetOtherDonation = "${comman_string}Donation/OtherDonation";
  static String GetMoneyDonation = "${comman_string}Donation/MoneyDonation";
  static String GetBloodDonation = "${comman_string}Donation/BloodDonation";
  static String GetOrganDonation = "${comman_string}Donation/OrganDonation";
  static String requestType = "${comman_string}Comman/GetList?Id=2";
  static String AddRequest = "${comman_string}Request/Save";
  static String SaveRequestImage = "${comman_string}Request/SaveImage";
  static String GetOtherRequest = "${comman_string}Request/OtherHelp";
  static String GetMedicalRequest = "${comman_string}Request/MedicalHelp";
  static String GetScholarshipRequest = "${comman_string}Request/Scholarship";
  static String SaveJobImage = "${comman_string}Job/SaveImage";
  static String GetJob = "${comman_string}Job/GetServerViewList";
  static String AddJob = "${comman_string}Job/Save";
  static String SaveBusinessImage = "${comman_string}Business/SaveImage";
  static String GetBusiness = "${comman_string}Business/GetServerViewList";
  static String AddBusiness = "${comman_string}Business/Save";
  static String SaveAdvertisementImage = "${comman_string}Advertisement/SaveImage";
  static String GetAdvertisement = "${comman_string}Advertisement/GetServerViewList";
  static String AddAdvertisement = "${comman_string}Advertisement/Save";
  static String SaveMarriageImage = "${comman_string}Marriage/SaveImage";
  static String GetMarriage = "${comman_string}Marriage/GetViewList";
  static String AddMarriage = "${comman_string}Marriage/Save";
  static String GetFeedback = "${comman_string}Feedback/GetViewList";
  static String AddFeedback = "${comman_string}Feedback/Save";
  static String SaveMarkSheetImage = "${comman_string}Marksheet/SaveImage";
  static String GetMarkSheet = "${comman_string}Marksheet/GetServerViewList";
  static String AddMarkSheet = "${comman_string}Marksheet/Save";
}