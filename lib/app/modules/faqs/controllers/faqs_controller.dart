import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FaqsController extends GetxController {

  final count = 0.obs;

  TextEditingController searchController = TextEditingController();
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

  clickOnLoadMoreButton() {}
}
