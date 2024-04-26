import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/recharge_controller.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({super.key});

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
