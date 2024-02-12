import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBankAccountController extends GetxController {
  final count = 0.obs;

  TextEditingController enterEmailController = TextEditingController();
  TextEditingController enterAmountController = TextEditingController();

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

  clickOnSendButton() {}
}
