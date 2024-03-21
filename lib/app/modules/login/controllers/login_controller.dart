import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/user_model.dart';
import 'package:hibapay/common/common_widgets.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final icPhone = false.obs;
  final countryCode = 'IN'.obs;
  final countryCodeShow = '+91'.obs;
  TextEditingController phoneController = TextEditingController();
  FocusNode focusPhone = FocusNode();

  Map<String, dynamic> queryParameters = {};

  final inAsyncCall = false.obs;

  @override
  void onInit() {
    super.onInit();
    startListener();
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

  clickOnForgotYourPasswordButton() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  clickOnLoginButton() async {
    if (phoneController.text.trim().isNotEmpty &&
        countryCode.value.trim().isNotEmpty) {
      inAsyncCall.value = true;
      queryParameters = {
        ApiKeyConstants.mobile: '${countryCode.value}-${phoneController.text}'
      };
      UserModel? userModel = await ApiMethods.loginMobile(
        queryParameters: queryParameters,
      );
      if (userModel != null &&
          userModel.result != null &&
          userModel.result!.otp != null &&
          userModel.result!.otp!.isNotEmpty) {
        if (userModel.result != null) {
          Get.toNamed(Routes.CHECK_YOUR_MAIL, parameters: {
            ApiKeyConstants.otp: userModel.result!.otp ?? '',
            ApiKeyConstants.mobile:
                '${countryCode.value}-${phoneController.text}'
          });
        }
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }

  clickOnResetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    icPhone.value = focusPhone.hasFocus;
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryCode.value = country.countryCode;
        countryCodeShow.value = "+ ${country.phoneCode}";
      },
    );
  }
}
