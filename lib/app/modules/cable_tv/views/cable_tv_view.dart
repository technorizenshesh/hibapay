import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/cable_tv_controller.dart';

class CableTvView extends GetView<CableTvController> {
  const CableTvView({Key? key}) : super(key: key);
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
                  controller: controller.decoderNumberController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.decoderNumber,
                    hintText: StringConstants.enterDecoderNumber,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  readOnly: true,
                  controller: controller.serviceProviderController,
                  decoration: CommonWidgets.inputDecoration(
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
