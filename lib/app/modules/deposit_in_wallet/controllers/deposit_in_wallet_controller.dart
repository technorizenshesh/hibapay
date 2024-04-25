import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DepositInWalletController extends GetxController {
  final count = 0.obs;
  final isAmount = false.obs;
  FocusNode focusAmount = FocusNode();
  TextEditingController amountController = TextEditingController();
  final inAsyncCall = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnTopUpWalletButton() {
    if (amountController.text.trim().isNotEmpty &&
        result != null &&
        result?.email != null &&
        result!.email!.isNotEmpty) {
      if (int.parse(amountController.text.toString()) >= 100) {
        Get.toNamed(Routes.WEB_VIEW, parameters: {
          ApiKeyConstants.paymentUrl:
              'https://hibapay.co/api/ufitpay/wallet-recharge?vendor_id=abahitechglobalservicesltd&amount=${amountController.text.toString()}&service_code=services&payer_email=${result?.email}&customer_account_id=${result?.id}'
        });
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', 'Minimum amount 100');
      }
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }
}
