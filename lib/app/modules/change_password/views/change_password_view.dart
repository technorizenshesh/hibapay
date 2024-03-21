import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnSaveButton(),
                  child: Text(
                    StringConstants.save,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
          appBar: CommonWidgets.appBar(title: StringConstants.changePassword),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      obscureText: controller.currentPasswordHide.value,
                      focusNode: controller.focusCurrentPassword,
                      title: StringConstants.currentPassword,
                      controller: controller.currentPasswordController,
                      isCard: controller.isCurrentPassword.value,
                      prefixIcon: CommonMethods.iconLinearGradient(
                          assetName: IconConstants.icPasswordInActive,
                          value: controller.isCurrentPassword.value),
                      hintText: StringConstants.pleaseEnterCurrentPassword,
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            controller.clickOnCurrentPasswordEyeButton(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonMethods.iconLinearGradient(
                              value: controller.isCurrentPassword.value,
                              assetName: controller.currentPasswordHide.value
                                  ? IconConstants.icView
                                  : IconConstants.icHide,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      obscureText: controller.newPasswordHide.value,
                      focusNode: controller.focusNewPassword,
                      title: StringConstants.newPassword,
                      controller: controller.newPasswordController,
                      isCard: controller.isNewPassword.value,
                      prefixIcon: CommonMethods.iconLinearGradient(
                        assetName: IconConstants.icPasswordInActive,
                        value: controller.isNewPassword.value,
                      ),
                      hintText: StringConstants.pleaseEnterNewPassword,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.clickOnNewPasswordEyeButton(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonMethods.iconLinearGradient(
                              value: controller.isNewPassword.value,
                              assetName: controller.newPasswordHide.value
                                  ? IconConstants.icView
                                  : IconConstants.icHide,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      obscureText: controller.confirmPasswordHide.value,
                      focusNode: controller.focusConfirmPassword,
                      title: StringConstants.confirmPassword,
                      controller: controller.confirmPasswordController,
                      isCard: controller.isConfirmPassword.value,
                      prefixIcon: CommonMethods.iconLinearGradient(
                        assetName: IconConstants.icPasswordInActive,
                        value: controller.isConfirmPassword.value,
                      ),
                      hintText: StringConstants.pleaseEnterConfirmPassword,
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            controller.clickOnConfirmPasswordEyeButton(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonMethods.iconLinearGradient(
                                assetName: controller.confirmPasswordHide.value
                                    ? IconConstants.icView
                                    : IconConstants.icHide,
                                value: controller.isConfirmPassword.value),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
