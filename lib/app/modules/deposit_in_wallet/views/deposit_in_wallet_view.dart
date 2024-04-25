import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/deposit_in_wallet_controller.dart';

class DepositInWalletView extends GetView<DepositInWalletController> {
  const DepositInWalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar:
              CommonWidgets.appBar(title: StringConstants.rechargeYourWallet),
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
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.topUpWallet,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 8.px),
                Text(
                  StringConstants.addMoney,
                  textAlign: TextAlign.center,
                  style: Theme.of(Get.context!).textTheme.titleMedium,
                ),
                SizedBox(height: 24.px),
                Center(
                  child: SizedBox(
                    width: 180.px,
                    child: Center(
                      child: TextField(
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 40.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: controller.amountController,
                        decoration: InputDecoration(
                          prefixIcon: Text(
                            '₦  ',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 40.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          hintText: '. . . .',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 40.px, fontWeight: FontWeight.w700),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
        ),
      );
    });
  }
}
