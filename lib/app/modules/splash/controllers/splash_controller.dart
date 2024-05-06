import 'dart:async';
import 'dart:convert';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  final authTokenHiba = ''.obs;

  @override
  void onInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(
            body: message.notification?.body ?? '',
            data: message.data['data'] ?? '',
            title: message.notification?.title ?? 'HibaPay');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(
            body: message.notification?.body ?? '',
            data: message.data['data'] ?? '',
            title: message.notification?.title ?? 'HibaPay');
      }
    });
    Timer(
      const Duration(seconds: 3),
      () => manageSession(),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> manageSession() async {
    selectedIndex.value = 0;
    increment();
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString(ApiKeyConstants.authTokenHiba) != null &&
        sp.getString(ApiKeyConstants.authTokenHiba)!.isNotEmpty) {
      authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
      Logger().i(authTokenHiba.value.toString);
      result = Result.fromJson(
          jsonDecode(sp.getString(ApiKeyConstants.result) ?? ''));
      // await getProfileApi();
      if (result != null &&
              result?.udocSelfyPhotoStatus != null &&
              result!.udocSelfyPhotoStatus!.isNotEmpty ||
          result?.virtualAccountDataAccountNumber != null &&
              result!.virtualAccountDataAccountNumber!.isNotEmpty) {
        // await onInitWorking();
        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        if (result != null && result!.id != null && result!.id!.isNotEmpty) {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString(ApiKeyConstants.userId, result?.id ?? '');
          Get.offAllNamed(Routes.VERIFY_IDENTITY);
        }
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  getProfileApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    UserModel? userModel = await ApiMethods.getProfile(bodyParams: bodyParams);
    if (userModel != null && userModel.result != null) {
      result = userModel.result!;
      increment();
    }
  }

  onInitWorking() async {
    await getBannersApi();
    await getServicesApi();
  }

  getBannersApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.type: ApiKeyConstants.home,
    };
    GetBannersModel? getBannersModel =
        await ApiMethods.getBanners(bodyParams: bodyParams);
    if (getBannersModel != null &&
        getBannersModel.result != null &&
        getBannersModel.result!.isNotEmpty) {
      getBannersResult = getBannersModel.result!;
      increment();
    }
  }

  getServicesApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    GetServicesModel? getServicesModel =
        await ApiMethods.getServices(bodyParams: bodyParams);
    if (getServicesModel != null &&
        getServicesModel.result != null &&
        getServicesModel.result!.isNotEmpty) {
      getServicesResult = getServicesModel.result!;
      increment();
    }
  }
}
