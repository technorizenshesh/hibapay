import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/betting_controller.dart';

class BettingView extends GetView<BettingController> {
  const BettingView({super.key});
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
                      focusNode: controller.focusEnterId,
                      title: StringConstants.userId,
                      controller: controller.enterIdController,
                      isCard: controller.isEnterId.value,
                      hintText: StringConstants.pleaseEnterId,
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
                    if (controller.getPackagesResultData.isNotEmpty)
                      SizedBox(height: 14.px),
                    if (controller.getPackagesResultData.isNotEmpty)
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusPackages,
                        title: StringConstants.packages,
                        controller: controller.packagesController,
                        isCard: controller.isPackages.value,
                        hintText: StringConstants.packages,
                        readOnly: true,
                        suffixIcon: CommonMethods.iconLinearGradient(
                            value: controller.isPackages.value,
                            assetName: IconConstants.icDownArrow,
                            width: 10.px,
                            height: 10.px),
                        onTap: () => controller.clickOnPackages(),
                      ),
                    /*if (controller.packages.isNotEmpty) SizedBox(height: 14.px),
                    if (controller.packages.isNotEmpty)
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusAmount,
                        title: StringConstants.enterAmount,
                        controller: controller.amountController,
                        isCard: controller.isAmount.value,
                        hintText: StringConstants.enterAmount,
                        readOnly: true,
                        suffixIcon: CommonMethods.iconLinearGradient(
                            value: controller.isAmount.value,
                            assetName: IconConstants.icDownArrow,
                            width: 10.px,
                            height: 10.px),
                        onTap: () => controller.clickOnPackagesAmount(),
                      ),*/
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
