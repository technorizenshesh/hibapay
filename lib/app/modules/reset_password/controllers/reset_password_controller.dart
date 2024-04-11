import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_widgets.dart';

class ResetPasswordController extends GetxController {
  final count = 0.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final inAsyncCall = false.obs;
  final selectedTab = 0.obs;

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
    if (selectedTab.value == 0) {
      if (emailController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        bodyParams = {
          ApiKeyConstants.email: emailController.text,
          ApiKeyConstants.type: ApiKeyConstants.byEmail,
        };
        UserModel? userModel = await ApiMethods.forgotPassword(
          bodyParams: bodyParams,
        );
        if (userModel != null &&
            userModel.result != null &&
            userModel.result!.otp != null &&
            userModel.result!.otp!.isNotEmpty) {
          if (userModel.result != null) {
            Get.toNamed(Routes.CHECK_YOUR_MAIL, parameters: {
              ApiKeyConstants.otp: userModel.result!.otp ?? '',
              ApiKeyConstants.email: emailController.text
            });
          }
        }
        inAsyncCall.value = false;
      } else {
        CommonWidgets.snackBarView(title: 'All field required');
      }
    } else {
      if (phoneController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        bodyParams = {
          ApiKeyConstants.email: phoneController.text,
          ApiKeyConstants.type: ApiKeyConstants.byMobile,
        };
        UserModel? userModel = await ApiMethods.forgotPassword(
          bodyParams: bodyParams,
        );
        if (userModel != null &&
            userModel.result != null &&
            userModel.result!.otp != null &&
            userModel.result!.otp!.isNotEmpty) {
          if (userModel.result != null) {
            Get.toNamed(Routes.CHECK_YOUR_MAIL, parameters: {
              ApiKeyConstants.otp: userModel.result!.otp ?? '',
              ApiKeyConstants.mobile: phoneController.text
            });
          }
        }
        inAsyncCall.value = false;
      } else {
        CommonWidgets.snackBarView(title: 'All field required');
      }
    }
  }

  clickOnResendCodeButton() {}

  clickOnTabs({required int value}) async {
    selectedTab.value = value;
  }
}
