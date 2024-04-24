import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/set_pin_controller.dart';

class SetPinView extends GetView<SetPinController> {
  const SetPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBar(title: StringConstants.setAccountPin),
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
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        maxLength: 4,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: controller.yourPinHide.value,
                        focusNode: controller.focusYourPin,
                        title: StringConstants.yourPin,
                        controller: controller.yourPinController,
                        isCard: controller.isYourPin.value,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isYourPin.value
                              ? IconConstants.icPasswordActive
                              : IconConstants.icPasswordInActive,
                        ),
                        hintText: StringConstants.pleaseEnterYourPin,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnYourPinHideEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonMethods.iconLinearGradient(
                                  assetName: controller.yourPinHide.value
                                      ? IconConstants.icHide
                                      : IconConstants.icView,
                                  value: controller.isYourPin.value),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        maxLength: 4,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: controller.retypePinHide.value,
                        focusNode: controller.focusRetypePin,
                        title: StringConstants.retypePin,
                        controller: controller.retypePinController,
                        isCard: controller.isRetypePin.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isRetypePin.value
                              ? IconConstants.icPasswordActive
                              : IconConstants.icPasswordInActive,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hintText: StringConstants.pleaseEnterRetypePin,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnRetypePinEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonMethods.iconLinearGradient(
                                  assetName: controller.retypePinHide.value
                                      ? IconConstants.icHide
                                      : IconConstants.icView,
                                  value: controller.isRetypePin.value),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        obscureText: controller.yourHibaPayPasswordHide.value,
                        focusNode: controller.focusYourHibaPayPassword,
                        title: StringConstants.yourHibaPayPassword,
                        controller: controller.yourHibaPayPasswordController,
                        isCard: controller.isYourHibaPayPassword.value,
                        prefixIcon: CommonMethods.appIcons(
                          assetName: controller.isYourHibaPayPassword.value
                              ? IconConstants.icPasswordActive
                              : IconConstants.icPasswordInActive,
                        ),
                        hintText:
                            StringConstants.pleaseEnterYourHibaPayPassword,
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnYourHibaPayPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonMethods.iconLinearGradient(
                                  assetName:
                                      controller.yourHibaPayPasswordHide.value
                                          ? IconConstants.icHide
                                          : IconConstants.icView,
                                  value:
                                      controller.isYourHibaPayPassword.value),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () =>
                            controller.clickOnSetAccountPinButton(),
                        child: Text(
                          StringConstants.setAccountPin,
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
        ),
      );
    });
  }
}
