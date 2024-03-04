import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/gift_user_controller.dart';

class GiftUserView extends GetView<GiftUserController> {
  const GiftUserView({Key? key}) : super(key: key);

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
                  readOnly: true,
                  controller: controller.billTagController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.billTag,
                    hintText: StringConstants.pleaseEnterBillTag,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  controller: controller.giftingAmountController,
                  decoration: CommonWidgets.inputDecoration(
                    labelText: StringConstants.giftingAmount,
                    hintText: StringConstants.pleaseEnterGiftingAmount,
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
