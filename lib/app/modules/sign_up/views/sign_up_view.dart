import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBar(),
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
                      SizedBox(height: 40.px),
                      CommonMethods.splashLogo(),
                      SizedBox(height: 34.px),
                      Text(
                        StringConstants.signUp,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 8.px),
                      Text(
                        StringConstants.enterYourPhoneNumber,
                        style: Theme.of(Get.context!).textTheme.titleMedium,
                      ),
                      SizedBox(height: 24.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusFullName,
                        title: StringConstants.fullName,
                        controller: controller.fullNameController,
                        isCard: controller.isFullName.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isFullName.value
                              ? IconConstants.icUserActive
                              : IconConstants.icUserInActive,
                        ),
                        hintText: StringConstants.pleaseEnterFullName,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusPhone,
                        title: StringConstants.phoneNumber,
                        controller: controller.phoneController,
                        isCard: controller.icPhone.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.icPhone.value
                              ? IconConstants.icPhoneActive
                              : IconConstants.icPhoneInActive,
                        ),
                        hintText: StringConstants.pleaseEnterPhoneNumber,
                      ),
                      SizedBox(height: 14.px),
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
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusStreetAddress,
                        title: StringConstants.streetAddress,
                        controller: controller.streetAddressController,
                        isCard: controller.isStreetAddress.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isStreetAddress.value
                              ? IconConstants.icStreetAddressActive
                              : IconConstants.icStreetAddressInActive,
                        ),
                        hintText: StringConstants.pleaseEnterStreetAddress,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusCity,
                        title: StringConstants.city,
                        controller: controller.cityController,
                        isCard: controller.isCity.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isCity.value
                              ? IconConstants.icCityActive
                              : IconConstants.icCityInActive,
                        ),
                        hintText: StringConstants.pleaseEnterCity,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        readOnly: true,
                        onTap: () => controller.clickOnCountryField(),
                        focusNode: controller.focusCountryOfResidence,
                        title: StringConstants.countryOfResidence,
                        controller: controller.countryOfResidenceController,
                        isCard: controller.isCountryOfResidence.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isCountryOfResidence.value
                              ? IconConstants.icCountryActive
                              : IconConstants.icCountryInActive,
                        ),
                        hintText: StringConstants.pleaseEnterCountryOfResidence,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        readOnly: true,
                        onTap: () => controller.clickOnDob(),
                        focusNode: controller.focusDateOfBirth,
                        title: StringConstants.dateOfBirth,
                        controller: controller.dateOfBirthController,
                        isCard: controller.isDateOfBirth.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isDateOfBirth.value
                              ? IconConstants.icCalendarActive
                              : IconConstants.icCalendarInActive,
                        ),
                        hintText: StringConstants.pleaseEnterDateOfBirth,
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
                          onTap: () => controller.clickOnPasswordEyeButton(),
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
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnSignUpButton(),
                        child: Text(
                          StringConstants.signUp,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 30.px),
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
                            onTap: () => controller.clickOnLoginButton(),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.px),
                              child: Text(
                                StringConstants.login,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).colorScheme.error,
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
