import 'dart:io';
import 'package:community_app/common/spacing.dart';
import 'package:community_app/common/themeService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  static const String userName = 'userName';
  static const String name = 'Name';
  static const String password = 'password';
  static const String employeeTypeID = 'EmployeeTypeID';
  static const String drawerList = 'DrawerList';
  static const List<String> adminAccess = [
    "Dashbord",
    "Lead",
    "Client",
    "Vendor",
    "Product",
    "Account",
    "Employee",
    "EmployeeRights",
    "LeadFollowup",
    "Quotation",
    "SalesOrder",
    "Payment",
    "Billing",
    "PurchaseOrder",
    "PurchaseEntry",
    "Attendance",
    "Expence",
    "CompanyProfile",
    "WorkOrder",
    "Complain",
    "Commission",
    "Task",
    "EmpSalary",
    "EmpPerformance",
    "SalesLedger",
    "OrderStatus",
    "EmpPerformanceHistory",
    "SellReturn",
    "SellReturnpayment",
    "PurReceipt",
    "Purpayment",
    "PurGRNEntry",
    "StockManagementReport",
    "EmpCommission",
    "ArchitechCommission",
    "JVHead",
    "CommissionPay",
    "JVTran",
    "EmpOutStanding",
    "ClinetOutstanding",
    "EmpCommissionPay",
    "JobWork",
    "CallFollowup",
    "ReadyforDeliveryReport",
    "CashBook",
    "PendingJobWorkReport",
    "PendingGenrateWOReport",
    "ManualWorkOrder",
    "Category",
    "Stock",
    "DirectStock",
    "IssueMaterial",
    "JobworkFollowup",
  ];

  static Future<bool> isInternetAvail() async {
    if (kIsWeb) {
      return true;
    }
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static Future progressDialog(bool show, {bool? goBack = true}) {
    if (show) {
      return Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: progressDialogLoader(),
        ),
        barrierDismissible: false,
      );
    } else {
      if (goBack == true) {
        Get.back();
      }
    }
    return Future.value();
  }

  static Widget progressDialogLoader() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacings.s10),
        ),
        height: AppSpacings.s100,
        width: AppSpacings.s100,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  static BoxDecoration getBoxDecoration({
    Color? color,
    BorderRadiusGeometry? borderRadius,
    double? radius,
    Border? border,
    Gradient? gradient,
    BoxShape? shape,
    num? elevation,
  }) {
    BorderRadiusGeometry borderRadiusBox = BorderRadius.all(Radius.circular(radius ?? 10));
    if (borderRadius is BorderRadiusGeometry) {
      borderRadiusBox = borderRadius;
    }
    return BoxDecoration(
      color: color ?? Get.theme.cardColor,
      borderRadius: shape == null ? borderRadiusBox : null,
      shape: shape ?? BoxShape.rectangle,
      boxShadow: [
        if (elevation != 0)
          BoxShadow(
            color: Get.theme.focusColor.withOpacity(0.1),
            blurRadius: elevation?.toDouble() ?? 10,
            offset: const Offset(0, 5),
          ),
      ],
      border:
          // border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
          Border.all(color: Colors.red),
      gradient: gradient,
    );
  }

  static Future showSuccessBottomSheet(
    String action, {
    bool showGetBack = true,
    bool showDoneText = true,
  }) async {
    Get.bottomSheet(
      WillPopScope(
        onWillPop: () async => true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                "assets/sofa.gif",
                gaplessPlayback: false,
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.fill,
              ).marginOnly(bottom: 10),
            ),
            Expanded(
              flex: 1,
              child: Text(
                showDoneText == true ? '$action Done' : action,
                style: Get.textTheme.headline5,
              ),
            )
          ],
        ),
      ),
      isDismissible: false,
      useRootNavigator: true,
      elevation: 10.0,
      enableDrag: false,
      backgroundColor: Get.theme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
    );
    if (showGetBack) {
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        Get.back();
      });
    }
  }

  static InputDecoration getInputDecoration({
    String? labelText = '',
    String hintText = '',
    String? errorText,
    Widget? iconData,
    Widget? suffixIcon,
    Widget? suffix,
    Widget? prefix,
    bool? removeBorder,
    double? borderRadius,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      hintStyle: Get.textTheme.caption?.copyWith(fontSize: AppSpacings.s16, color: ThemeService.grayScalecon),
      prefixIcon: iconData,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: removeBorder ?? false ? 0 : 8),
      border: removeBorder ?? false
          ? InputBorder.none
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
      suffixIcon: suffixIcon,
      suffix: suffix,
      prefix: prefix,
      errorText: errorText,
    );
  }

  static Future ErrorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    return Future.delayed(Duration.zero).then(
      (value) => Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            title.tr,
            style: Get.textTheme.headline4?.merge(TextStyle(color: Get.theme.cardColor)),
          ),
          messageText: Text(
            message ?? '',
            style: Get.textTheme.caption?.merge(TextStyle(color: Get.theme.cardColor)),
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          backgroundColor: Colors.redAccent,
          icon: Icon(
            Icons.remove_circle_outline,
            size: 32,
            color: Get.theme.cardColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          duration: const Duration(seconds: 5),
        ),
      ),
    );
  }

  static Future successSnackBar({String title = 'Success', String? message}) {
    Get.log("[$title] $message", isError: true);
    return Future.delayed(Duration.zero).then(
      (value) => Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            title.tr,
            style: Get.textTheme.headline4?.merge(TextStyle(color: Get.theme.cardColor)),
          ),
          messageText: Text(
            message ?? '',
            style: Get.textTheme.caption?.merge(TextStyle(color: Get.theme.cardColor)),
          ),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          backgroundColor: ThemeService.primaryColor,
          icon: Icon(
            Icons.remove_circle_outline,
            size: 32,
            color: Get.theme.cardColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          duration: const Duration(seconds: 5),
        ),
      ),
    );
  }

  Widget empty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppSpacings.s60),
        Image.asset("assets/empty.png"),
        SizedBox(height: AppSpacings.s20),
        Text(
          "No Data Found!!",
          textAlign: TextAlign.center,
          style: Get.textTheme.caption!.copyWith(fontSize: AppSpacings.s20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(height: AppSpacings.s10),
      ],
    );
  }
}
