import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

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
                        StringConstants.passwordReset,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 8.px),
                      Text(
                        StringConstants
                            .pleasePutYourEmailOrMobileNumberToResetYourPassword,
                        style: Theme.of(Get.context!).textTheme.titleMedium,
                      ),
                      SizedBox(height: 24.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusEmail,
                        title: StringConstants.email,
                        controller: controller.emailController,
                        isCard: controller.isEmail.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isEmail.value
                              ? IconConstants.icEmailActive
                              : IconConstants.icEmailInActive,
                        ),
                        hintText: StringConstants.pleaseEnterEmail,
                      ),
                      /*SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusPhone,
                      title: StringConstants.phoneNumber,
                      controller: controller.phoneController,
                      isCard: controller.isPhone.value,
                      prefixIcon: CommonMethods.appIcons(
                        assetName: controller.isPhone.value
                            ? IconConstants.icPhoneActive
                            : IconConstants.icPhoneInActive,
                      ),
                      hintText: StringConstants.pleaseEnterEmail,
                    ),*/
                      /* SizedBox(height: 20.px),
                      InkWell(
                        borderRadius: BorderRadius.circular(4.px),
                        onTap: () => controller.clickOnSubmitButton(),
                        child: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: Text(
                            StringConstants.resendCode,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),*/
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
