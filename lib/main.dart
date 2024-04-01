import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/theme_data.dart';

Future<void> main() async {
/*  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(
    GetMaterialApp(
      title: "HIBA PAY",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData(fontFamily: 'Poppins'),
    ),
  );
}
