import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:hibapay/common/progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/string_constants.dart';
import '../controllers/electricity_controller.dart';

class ElectricityView extends GetView<ElectricityController> {
  const ElectricityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: controller.title),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusMeterNumber,
                      title: StringConstants.meterNumber,
                      controller: controller.meterNumberController,
                      isCard: controller.isMeterNumber.value,
                      hintText: StringConstants.pleaseEnterMeterNumber,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusServiceProvider,
                      title: StringConstants.serviceProvider,
                      controller: controller.serviceProviderController,
                      isCard: controller.isServiceProvider.value,
                      hintText: StringConstants.serviceProvider,
                      readOnly: true,
                      suffixIcon: CommonMethods.iconLinearGradient(
                          value: controller.isServiceProvider.value,
                          assetName: IconConstants.icDownArrow,
                          width: 10.px,
                          height: 10.px),
                      onTap: () => controller.clickOnServiceProvider(),
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusAmount,
                      title: StringConstants.enterAmount,
                      controller: controller.amountController,
                      isCard: controller.isAmount.value,
                      hintText: StringConstants.enterAmount,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnContinueButton(),
                      child: Text(
                        StringConstants.continueText,
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
