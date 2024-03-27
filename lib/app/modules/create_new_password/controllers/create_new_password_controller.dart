import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/user_model.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class CreateNewPasswordController extends GetxController {
  final count = 0.obs;
  final isNewPassword = false.obs;
  final isConfirmPassword = false.obs;
  final inAsyncCall = false.obs;

  FocusNode focusNewPassword = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;

  Map<String, String> bodyParams = {};

  final authTokenHiba = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
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

  clickOnSubmitButton() async {
    // Get.toNamed(Routes.CREATE_YOUR_SMARTPAY_CARD);
    if (newPasswordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.password: newPasswordController.text,
        ApiKeyConstants.confirmPassword: confirmPasswordController.text,
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      UserModel? userModel = await ApiMethods.createPassword(
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.status != null &&
          userModel.status!.isNotEmpty &&
          userModel.status == '1') {
        Get.offAllNamed(Routes.LOGIN);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }

  clickOnEyeNewPasswordButton() {
    hideNewPassword.value = !hideNewPassword.value;
  }

  clickOnEyeConfirmPasswordButton() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }
}
