import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/modules/data/controllers/data_controller.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class DataView extends GetView<DataController> {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: controller.title),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnContinueButton(),
              child: Text(
                StringConstants.continueText,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      focusNode: controller.focusMobileNumber,
                      title: StringConstants.mobileNumber,
                      controller: controller.mobileNumberController,
                      isCard: controller.isMobileNumber.value,
                      hintText: StringConstants.pleaseEnterMobileNumber,
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
                    if (controller.packages.isNotEmpty) SizedBox(height: 14.px),
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
