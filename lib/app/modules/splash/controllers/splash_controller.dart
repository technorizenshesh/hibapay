import 'dart:async';

import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
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
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString(ApiKeyConstants.authTokenHiba) != null &&
        sp.getString(ApiKeyConstants.authTokenHiba)!.isNotEmpty) {
      Get.offAllNamed(Routes.NAV_BAR);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
