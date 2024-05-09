import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
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
              children: [
                SizedBox(height: 24.px),
                if (controller.listVirtualCardsResult.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listVirtualCardsResult.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.px),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.surface,
                            width: .4.px,
                          ),
                        ),
                        trailing: CommonMethods.appIcons(
                            assetName: IconConstants.icRightArrow),
                        subtitle: Text(
                          controller.listVirtualCardsResult[index]
                                  .vcardCardNumber ??
                              '',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                        title: Text(
                          controller.listVirtualCardsResult[index].vcardName ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(24.px),
                          child: Image.asset(
                            'assets/images/img_logo.png',
                            height: 48.px,
                            width: 48.px,
                          ),
                        ),
                      );
                    },
                  ),
                SizedBox(height: 40.px),
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
                /*Text(
                  '$appCurrency 8,256',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 40.px,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                SizedBox(height: 10.px),
                Text(
                  'Maximum $appCurrency 12,652.00',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 20.px),*/
                /*CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusAmount,
                  title: StringConstants.enterAmount,
                  controller: controller.amountController,
                  isCard: controller.isAmount.value,
                  hintText: StringConstants.pleaseEnterAmount,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),*/
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
                          prefixIcon: CommonMethods.iconLinearGradient(
                            assetName: IconConstants.icCur,
                            value: controller.isAmount.value,
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
