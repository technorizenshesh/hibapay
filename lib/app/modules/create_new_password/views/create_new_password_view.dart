import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: CommonWidgets.appBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnSubmitButton(),
                    child: Text(
                      StringConstants.submit,
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
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 34.px),
                      Text(
                        StringConstants.createNewPassword,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 8.px),
                      Text(
                        StringConstants
                            .yourNewPasswordMustBeDifferentFromPreviousUsedPasswords,
                        style: Theme.of(Get.context!).textTheme.titleMedium,
                      ),
                      SizedBox(height: 24.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusNewPassword,
                        title: StringConstants.newPassword,
                        controller: controller.newPasswordController,
                        isCard: controller.isNewPassword.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isNewPassword.value
                              ? IconConstants.icPasswordActive
                              : IconConstants.icPasswordInActive,
                        ),
                        hintText: StringConstants.pleaseEnterNewPassword,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusConfirmPassword,
                        title: StringConstants.confirmPassword,
                        controller: controller.confirmPasswordController,
                        isCard: controller.isConfirmPassword.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isConfirmPassword.value
                              ? IconConstants.icPasswordActive
                              : IconConstants.icPasswordInActive,
                        ),
                        hintText: StringConstants.confirmPassword,
                      ),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
