import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CreateNewPasswordController extends GetxController {
  final count = 0.obs;
  final isNewPassword = false.obs;
  final isConfirmPassword = false.obs;

  FocusNode focusNewPassword = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;

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

  void onFocusChange() {
    isNewPassword.value = focusNewPassword.hasFocus;
    isConfirmPassword.value = focusConfirmPassword.hasFocus;
  }

  void startListener() {
    focusNewPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnSubmitButton() {
    Get.toNamed(Routes.CREATE_YOUR_SMARTPAY_CARD);
  }

  clickOnEyeNewPasswordButton() {
    hideNewPassword.value = !hideNewPassword.value;
  }

  clickOnEyeConfirmPasswordButton() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }
}
