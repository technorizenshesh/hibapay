import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: DefaultTabController(
          length: 2,
          animationDuration: const Duration(microseconds: 0),
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
                padding:
                    EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
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
                        SizedBox(height: 12.px),
                        Container(
                          height: 44.px,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.1.px),
                            borderRadius: BorderRadius.circular(8.px),
                          ),
                          child: TabBar(
                            splashBorderRadius: BorderRadius.circular(8.px),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.px),
                              color: Theme.of(context).primaryColor,
                            ),
                            labelColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            unselectedLabelColor: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.color,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            // Set indicatorSize to tab
                            dividerColor: Colors.transparent,
                            onTap: (value) =>
                                controller.clickOnTabs(value: value),
                            physics: const NeverScrollableScrollPhysics(),
                            tabs: [
                              tabTexts(text: StringConstants.email, index: 0),
                              tabTexts(
                                  text: StringConstants.mobileNumber, index: 1),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.px),
                        controller.selectedTab.value == 0
                            ? CommonWidgets.commonTextFieldForLoginSignUP(
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
                              )
                            : CommonWidgets.commonTextFieldForLoginSignUP(
                                focusNode: controller.focusPhone,
                                title: StringConstants.phoneNumber,
                                controller: controller.phoneController,
                                isCard: controller.isPhone.value,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                prefixIcon: CommonMethods.appIcons(
                                  assetName: controller.isPhone.value
                                      ? IconConstants.icPhoneActive
                                      : IconConstants.icPhoneInActive,
                                ),
                                hintText:
                                    StringConstants.pleaseEnterMobileNumber,
                              ),
                        SizedBox(height: 10.px),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget tabTexts({required String text, required int index}) {
    return Text(
      text,
      style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
          fontSize: 16.px,
          color: controller.selectedTab.value == index
              ? Theme.of(Get.context!).scaffoldBackgroundColor
              : Theme.of(Get.context!).primaryColor),
    );
  }
}
