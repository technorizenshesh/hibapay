import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/pay_amount_controller.dart';

class PayAmountView extends GetView<PayAmountController> {
  const PayAmountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(
        title: StringConstants.payNow,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.px),
        child: Column(children: [
          ListTile(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.px),
              borderSide: BorderSide(
                color:
                Theme.of(context).colorScheme.surface,
                width: .4.px,
              ),
            ),
            trailing: CommonMethods.appIcons(
                assetName: IconConstants.icCheck),
            subtitle: Text(
              '**** **** **** 1121',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(
                fontSize: 12.px,
              ),
            ),
            title: Text(
              'Abram Stanton',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                  fontSize: 14.px,
                  color:
                  Theme.of(context).primaryColor),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(24.px),
              child: Image.asset(
                'assets/images/img_logo.png',
                height: 48.px,
                width: 48.px,
              ),
            ),
          ),
          SizedBox(height: 14.px),
          TextField(
            controller: controller.amountController,
            decoration: CommonWidgets.inputDecoration(
              labelText: StringConstants.enterAmount,
              hintText:
              StringConstants.pleaseEnterAccountName,
            ),
          ),
          SizedBox(height: 14.px),
          TextField(
            controller: controller.addNotesController,
            decoration: CommonWidgets.inputDecoration(
              labelText: StringConstants.addNotes,
              hintText: StringConstants.typeHere,
            ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonElevatedButton(
            onPressed: () => controller.clickOnPayNowButton(),
            child: Text(
              StringConstants.payNow,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ]),
      ),
    );
  }
}
