import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentController extends GetxController {
  final count = 0.obs;
  final selectedValue = ''.obs;

  Map<String, String?> parameters = Get.parameters;
  String title = '';

  TextEditingController meterNumberController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  List listOfServices = ['pay', 'ment', 'add', 'card'];

  @override
  void onInit() {
    title = parameters['title'] ?? '';
    selectedValue.value = listOfServices.first;
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
