import 'package:flutter/material.dart';
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
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                    CommonMethods.splashLogo(),
                    SizedBox(height: 34.px),
                    Text(
                      StringConstants.login,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: 8.px),
                    Text(
                      StringConstants.enterYourPhoneNumber,
                      style: Theme.of(Get.context!).textTheme.titleMedium,
                    ),
                    SizedBox(height: 24.px),
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
        ),
      );
    });
  }
}
