import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: DefaultTabController(
          length: 2,
          animationDuration: const Duration(microseconds: 0),
          child: Scaffold(
              extendBody: true,
              resizeToAvoidBottomInset: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringConstants.doNotHaveAnAccount,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                        InkWell(
                          onTap: () => controller.clickOnSignUpButton(),
                          borderRadius: BorderRadius.circular(4.px),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.px),
                            child: Text(
                              StringConstants.signUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
              body: ProgressBar(
                inAsyncCall: controller.inAsyncCall.value,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 5),
                          CommonMethods.splashLogo(),
                          SizedBox(height: 34.px),
                          Text(
                            StringConstants.login,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(height: 8.px),
                          Text(
                            StringConstants.loginWithEmailAndMobileNumber,
                            style: Theme.of(Get.context!).textTheme.titleMedium,
                          ),
                          SizedBox(height: 24.px),
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
                                    text: StringConstants.mobileNumber,
                                    index: 1),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.px),
                          controller.selectedTab.value != 0
                              ? Row(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          controller.clickOnCountryField(),
                                      borderRadius:
                                          BorderRadius.circular(14.px),
                                      child: Container(
                                        height: 50.px,
                                        // width: 50.px,
                                        decoration: BoxDecoration(
                                          gradient: controller.icPhone.value
                                              ? CommonMethods
                                                  .commonLinearGradientView()
                                              : CommonMethods
                                                  .commonLinearGradientViewGrey(),
                                          borderRadius:
                                              BorderRadius.circular(14.px),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(1.4.px),
                                          decoration: BoxDecoration(
                                            color: Theme.of(Get.context!)
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(14.px),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.px,
                                                  vertical: 2.px),
                                              child: Text(
                                                controller
                                                    .countryCodeShow.value,
                                                style: Theme.of(Get.context!)
                                                    .textTheme
                                                    .headlineMedium
                                                    ?.copyWith(fontSize: 14.px),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6.px),
                                    Expanded(
                                      child: CommonWidgets
                                          .commonTextFieldForLoginSignUP(
                                        focusNode: controller.focusPhone,
                                        title: StringConstants.phoneNumber,
                                        controller: controller.phoneController,
                                        isCard: controller.icPhone.value,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        prefixIcon: CommonMethods.appIcons(
                                          assetName: controller.icPhone.value
                                              ? IconConstants.icPhoneActive
                                              : IconConstants.icPhoneInActive,
                                        ),
                                        hintText: StringConstants
                                            .pleaseEnterPhoneNumber,
                                      ),
                                    ),
                                  ],
                                )
                              : CommonWidgets.commonTextFieldForLoginSignUP(
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
                          SizedBox(height: 14.px),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                            obscureText: controller.passwordHide.value,
                            focusNode: controller.focusPassword,
                            title: StringConstants.password,
                            controller: controller.passwordController,
                            isCard: controller.isPassword.value,
                            prefixIcon: CommonMethods.appIcons(
                              assetName: controller.isPassword.value
                                  ? IconConstants.icPasswordActive
                                  : IconConstants.icPasswordInActive,
                            ),
                            hintText: StringConstants.pleaseEnterPassword,
                            suffixIcon: GestureDetector(
                              onTap: () =>
                                  controller.clickOnPasswordEyeButton(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonMethods.iconLinearGradient(
                                      assetName: controller.passwordHide.value
                                          ? IconConstants.icHide
                                          : IconConstants.icView,
                                      value: controller.isPassword.value),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          InkWell(
                            borderRadius: BorderRadius.circular(4.px),
                            onTap: () => controller.clickOnResetPassword(),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Text(
                                StringConstants.resetPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () => controller.clickOnLoginButton(),
                            child: Text(
                              StringConstants.login,
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
                  ],
                ),
              )),
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
