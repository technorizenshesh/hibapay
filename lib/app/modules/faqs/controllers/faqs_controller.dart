import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/faqs_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqsController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();
  final inAsyncCall = false.obs;

  List<FaqsResult> faqsResult = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
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

  onInitWorking() async {
    await faqsApi();
  }

  faqsApi() async {
    FaqsModel? faqsModel = await ApiMethods.faqs();
    if (faqsModel != null &&
        faqsModel.result != null &&
        faqsModel.result!.isNotEmpty) {
      faqsResult = faqsModel.result!;
    }
  }
}
