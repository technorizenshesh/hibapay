import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/user_model.dart';
import 'package:hibapay/app/routes/app_pages.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordController extends GetxController {
  final count = 0.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final inAsyncCall = false.obs;

  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

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
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnSubmitButton() async {
    if (emailController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.email: emailController.value,
        ApiKeyConstants.type: ApiKeyConstants.byEmail
      };
      UserModel? userModel = await ApiMethods.forgotPassword(
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

  clickOnResendCodeButton() {}
}
