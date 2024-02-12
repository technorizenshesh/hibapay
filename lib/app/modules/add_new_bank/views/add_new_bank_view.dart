import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/add_new_bank_controller.dart';

class AddNewBankView extends GetView<AddNewBankController> {
  const AddNewBankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.addBankAccount),
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
                      controller: controller.accountNumberController,
                      decoration: CommonWidgets.inputDecoration(
                        labelText: StringConstants.accountNumber,
                        hintText: StringConstants.pleaseEnterAccountNumber,
                      ),
                    ),
                    SizedBox(height: 14.px),
                    TextField(
                      readOnly: true,
                      controller: controller.currencyController,
                      decoration: CommonWidgets.inputDecoration(
                        labelText: StringConstants.currency,
                        hintText: StringConstants.pleaseEnterCurrency,
                      ),
                    ),
                    SizedBox(height: 14.px),
                    TextField(
                      controller: controller.accountNameController,
                      decoration: CommonWidgets.inputDecoration(
                        labelText: StringConstants.accountName,
                        hintText: StringConstants.pleaseEnterAccountName,
                      ),
                    ),
                    SizedBox(height: 14.px),
                    TextField(
                      controller: controller.bankNameController,
                      decoration: CommonWidgets.inputDecoration(
                        labelText: StringConstants.bankName,
                        hintText: StringConstants.pleaseEnterBankName,
                      ),
                    ),
                    SizedBox(height: 14.px),
                    TextField(
                      controller: controller.mobileNumberController,
                      decoration: CommonWidgets.inputDecoration(
                        labelText: StringConstants.mobileNumber,
                        hintText: StringConstants.pleaseEnterMobileNumber,
                      ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnSubmitButton(),
                      child: Text(
                        StringConstants.submit,
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
        ),
      );
    });
  }
}
