import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/user_model.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class CheckYourMailController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController pin = TextEditingController();
  Map parameters = Get.parameters;

  final mobile = ''.obs;
  final otp = ''.obs;

  Map<String, String> bodyParams = {};

  @override
  void onInit() {
    mobile.value = parameters[ApiKeyConstants.mobile] ?? '';
    otp.value = parameters[ApiKeyConstants.otp] ?? '';
    pin.text = otp.value;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnNextButton() async {
    if (pin.text.trim().isNotEmpty && mobile.value.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.mobile: mobile.value,
        ApiKeyConstants.otp: pin.text
      };
      UserModel? userModel = await ApiMethods.verifyOtpMobile(
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.token != null &&
          userModel.token!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.token ?? '');
        Get.toNamed(Routes.NAV_BAR);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }
}
