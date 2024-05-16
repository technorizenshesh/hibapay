import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/virtual_account_add_controller.dart';

class VirtualAccountAddView extends GetView<VirtualAccountAddController> {
  const VirtualAccountAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.addVirtualAccount),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.px),
        child: CommonWidgets.commonElevatedButton(
          onPressed: () => controller.clickOnContinueButton(),
          child: Text(
            StringConstants.continueText,
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
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      readOnly: true,
                      focusNode: controller.focusFirstName,
                      title: StringConstants.firstName,
                      controller: controller.firstNameController,
                      isCard: controller.isFirstName.value,
                      hintText: StringConstants.pleaseEnterFirstName,
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      readOnly: true,
                      focusNode: controller.focusLastName,
                      title: StringConstants.lastName,
                      controller: controller.lastNameController,
                      isCard: controller.isLastName.value,
                      hintText: StringConstants.pleaseEnterLastName,
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      readOnly: true,
                      focusNode: controller.focusBvn,
                      title: StringConstants.bvn,
                      controller: controller.bvnController,
                      isCard: controller.isBvn.value,
                      hintText: StringConstants.pleaseEnterBvn,
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      readOnly: true,
                      onTap: () => controller.clickOnBankName(),
                      focusNode: controller.focusBankName,
                      title: StringConstants.bankName,
                      controller: controller.bankNameController,
                      isCard: controller.isBankName.value,
                      hintText: StringConstants.pleaseEnterBankName,
                    ),
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
