import 'dart:developer';
import 'dart:io';

import 'package:community_app/common/responsive_layout_builder.dart';
import 'package:community_app/common/routes/page_routes.dart';
import 'package:community_app/common/scale_factors.dart';
import 'package:community_app/common/themeService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClientcreateHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
  log("Handling a background message: ${message!.messageId}");
}

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseOptions options;
  // if (Platform.isAndroid) {
  //   options = const FirebaseOptions(
  //       apiKey: "AIzaSyC9fXUGGiFqJq2BfCmnWxhZiBoBS3t1bHQ",
  //       appId: "1:832919346886:android:7e189aa0fa61fb9a2341c7",
  //       messagingSenderId: "832919346886",
  //       projectId: "community-93d6f");
  // } else {
  //   options = const FirebaseOptions(
  //       apiKey: "AIzaSyC9fXUGGiFqJq2BfCmnWxhZiBoBS3t1bHQ",
  //       appId: "1:832919346886:android:7e189aa0fa61fb9a2341c7",
  //       messagingSenderId: "832919346886",
  //       projectId: "community-93d6f");
  // }
  // await Firebase.initializeApp(options: options);
  // try {
  //   HttpOverrides.global = MyHttpOverrides();
  //   await Firebase.initializeApp();
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // } on Exception catch (e) {
  //   log(e.toString());
  // }
  await GetStorage.init();

  runApp(
    ResponsiveLayoutBuilder(
      small: (BuildContext context, Widget? child) => MyApp(
        lightTheme: Get.find<ThemeService>()
            .getLightTheme(scaleFactor: DeviceScaleFactors.smallScaleFactor),
        darkTheme: Get.find<ThemeService>()
            .getDarkTheme(scaleFactor: DeviceScaleFactors.smallScaleFactor),
      ),
      medium: (BuildContext context, Widget? child) => MyApp(
        lightTheme: Get.find<ThemeService>()
            .getLightTheme(scaleFactor: DeviceScaleFactors.mediumScaleFactor),
        darkTheme: Get.find<ThemeService>()
            .getDarkTheme(scaleFactor: DeviceScaleFactors.mediumScaleFactor),
      ),
      large: (BuildContext context, Widget? child) => MyApp(
        lightTheme: Get.find<ThemeService>()
            .getLightTheme(scaleFactor: DeviceScaleFactors.largeScaleFactor),
        darkTheme: Get.find<ThemeService>()
            .getDarkTheme(scaleFactor: DeviceScaleFactors.largeScaleFactor),
      ),
      xLarge: (BuildContext context, Widget? child) => MyApp(
        lightTheme: Get.find<ThemeService>()
            .getLightTheme(scaleFactor: DeviceScaleFactors.xLargeScaleFactor),
        darkTheme: Get.find<ThemeService>()
            .getDarkTheme(scaleFactor: DeviceScaleFactors.xLargeScaleFactor),
      ),
    ),
  );
  Get.lazyPut(() => ThemeService());
}

class MyApp extends StatelessWidget {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const MyApp({Key? key, required this.lightTheme, required this.darkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Community",
      initialRoute: PageRoutes.initial,
      getPages: PageRoutes.routes,
      defaultTransition: Transition.cupertino,
      themeMode: Get.find<ThemeService>().getThemeMode(),
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
