import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/add_bank_account_controller.dart';

class AddBankAccountView extends GetView<AddBankAccountController> {
  const AddBankAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CommonMethods.unFocsKeyBoard();
      },
      child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.addBankAccount),
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnSendButton(),
                  child: Text(
                    StringConstants.send,
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: ListView(
              children: [
                SizedBox(height: 20.px),
                TextField(
                  controller: controller.enterEmailController,
                  decoration: CommonWidgets.inputDecoration(
                    hintText: StringConstants.pleaseEnterEmail,
                  ),
                ),
                SizedBox(height: 14.px),
                TextField(
                  controller: controller.enterAmountController,
                  decoration: CommonWidgets.inputDecoration(
                    hintText: StringConstants.pleaseEnterAmount,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
