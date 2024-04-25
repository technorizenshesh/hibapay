import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnPayButton(),
              child: Text(
                StringConstants.pay,
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
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      focusNode: controller.focusAmount,
                      title: StringConstants.enterAmount,
                      controller: controller.amountController,
                      onChanged: (value) {
                        if (controller.amountController.text.isNotEmpty &&
                            controller.amountController.text[0] != '0') {
                          controller.amountControllerValue.value = value;
                          controller.amountController.text =
                              "₦ ${controller.amountController.text.toString()}";
                        } else {
                          controller.amountController.text = '';
                          controller.amountControllerValue.value =
                              controller.amountController.text.toString();
                        }
                      },
                      isCard: controller.isAmount.value,
                      hintText: StringConstants.enterAmount,
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
