import 'dart:async';

import 'package:HibaPay/app/app_controller/ac.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/theme_data.dart';

Future<void> main() async {
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  WidgetsFlutterBinding.ensureInitialized();
  late StreamSubscription streamSubscription;
  AC().getNetworkConnectionType();
  streamSubscription = AC().checkNetworkConnection();
  runApp(
    GetMaterialApp(
      title: "HibaPay",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData(fontFamily: 'Poppins'),
    ),
  );
}
