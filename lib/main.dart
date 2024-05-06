import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/theme_data.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    showNotification(
        body: message.notification?.body ?? '',
        data: message.data['data'] ?? '',
        title: message.notification?.title ?? 'HibaPay');
  }
}

Future<void> showNotification(
    {required String body, required String data, required String title}) async {
  print('body:::::::::::::::::::${body}');
  print('title:::::::::::::::::::${title}');
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  try {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'HibaPay',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      visibility: NotificationVisibility.public,
      icon: '@mipmap/ic_launcher',
      color: Theme.of(Get.context!).primaryColor,
      enableVibration: true,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title, // Notification title
      body, // Notification body
      platformChannelSpecifics,
      payload: body,
    );
  } catch (e) {
    print('e:::::::::::::::::::::::::$e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
