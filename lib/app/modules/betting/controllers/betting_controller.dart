import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BettingController extends GetxController {
  final count = 0.obs;

  Map<String, String?> parameters = Get.parameters;
  String title = '';

  TextEditingController amountController = TextEditingController();
  TextEditingController enterIdController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();

  @override
  void onInit() {
    title = parameters['title'] ?? '';
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

  clickOnContinueButton() {}
}
