import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/add_money_wallet_controller.dart';

class AddMoneyWalletView extends GetView<AddMoneyWalletController> {
  const AddMoneyWalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.addVirtualAccount),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.px),
        child: CommonWidgets.commonElevatedButton(
          onPressed: () => controller.clickOnAddMoneyButton(),
          child: Text(
            StringConstants.addMoneyText,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Obx(() {
        controller.count.value;
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.px),
                    Text(
                      'How much money would you like to add to your wallet?',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 14.px),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusMoney,
                      title: StringConstants.addAmount,
                      controller: controller.addMoneyController,
                      isCard: controller.isMoney.value,
                      hintText: StringConstants.pleaseEnterAmount,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
