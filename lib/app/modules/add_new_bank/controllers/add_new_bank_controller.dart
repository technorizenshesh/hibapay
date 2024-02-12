import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNewBankController extends GetxController {
  final count = 0.obs;

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

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

  clickOnSubmitButton() {}
}
