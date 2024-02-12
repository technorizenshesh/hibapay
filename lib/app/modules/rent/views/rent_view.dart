import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rent_controller.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/constants/string_constants.dart';


class RentView extends GetView<RentController> {
  const RentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                TextField(
                  controller: controller.meterNumberController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.meterNumber,
                    hintText: StringConstants.pleaseEnterMeterNumber,
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
