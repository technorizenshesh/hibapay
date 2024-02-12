import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bil_payment_controller.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/constants/string_constants.dart';

class BilPaymentView extends GetView<BilPaymentController> {
  const BilPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.bilPayment),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.px),
                TextField(
                  controller: controller.meterNumberController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.meterNumber,
                    hintText: StringConstants.pleaseEnterMeterNumber,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  readOnly: true,
                  onTap: () => controller.clickOnServiceProvider(),
                  controller: controller.serviceProviderController,
                  decoration: CommonWidgets.inputDecoration(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.px,
                    ),
                    labelText: StringConstants.serviceProvider,
                    hintText: StringConstants.selectProvider,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  controller: controller.amountController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.enterAmount,
                    hintText: StringConstants.pleaseEnterAccountName,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  controller: controller.nickNameController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.nickName,
                    hintText: StringConstants.pleaseEnterNickName,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  readOnly: true,
                  onTap: () => controller.clickOnAccountDoYouPay(),
                  controller:
                      controller.fromWhichAccountDoYouWantToPayController,
                  decoration: CommonWidgets.inputDecoration(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24.px,
                    ),
                    labelText: StringConstants.fromWhichAccountDoYouWantToPay,
                    hintText: StringConstants.fromWhichAccountDoYouWantToPay,
                  ),
                ),
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          // Handle the checkbox toggle
                          controller.isChecked.value =
                              !controller.isChecked.value;
                          controller.increment();
                        },
                        child: Container(
                          height: 20.px,
                          width: 20.px,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2.px, // Border width
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: controller.isChecked.value
                              ? Center(
                                  child: Icon(
                                    Icons.check_rounded,
                                    size: 16.px,
                                    color: Theme.of(context)
                                        .primaryColor, // Color of the check icon when selected
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.px),
                    Flexible(
                      child: Text(
                        StringConstants.iAgreeAndAllowHibaPay,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
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
    );
  }
}
