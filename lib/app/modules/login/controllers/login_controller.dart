import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final icPhone = false.obs;
  TextEditingController phoneController = TextEditingController();
  FocusNode focusPhone = FocusNode();

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

  clickOnLoginButton() {
    Get.toNamed(Routes.CHECK_YOUR_MAIL);
  }

  clickOnForgotYourPasswordButton() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  clickOnSignInButton() {}

  clickOnResetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    icPhone.value = focusPhone.hasFocus;
  }
}
