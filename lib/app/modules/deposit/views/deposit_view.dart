import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.deposit),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
          child: CommonWidgets.commonElevatedButton(
            onPressed: () => controller.clickOnTopUpWalletButton(),
            child: Text(
              StringConstants.topUpWallet,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.px),
              Text(
                StringConstants.topUpWallet,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 8.px),
              Text(
                StringConstants.addMoney,
                style: Theme.of(Get.context!).textTheme.titleMedium,
              ),
              SizedBox(height: 24.px),
              Text(
                '${CommonMethods.cur} 8,256',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 40.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 10.px),
              Text(
                'Maximum ${CommonMethods.cur} 12,652.00',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 12.px,
                    ),
              ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
