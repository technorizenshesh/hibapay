import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RateUsController extends GetxController {
  final count = 0.obs;

  TextEditingController reviewController = TextEditingController();

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

  clickOnRatting({required ratingStatus}) {}
}
