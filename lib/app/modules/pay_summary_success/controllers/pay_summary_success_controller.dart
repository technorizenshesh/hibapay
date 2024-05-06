import 'package:get/get.dart';

class PaySummarySuccessController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.arguments;

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

  clickOnBackToHomeButton() {
    Get.back();
  }
}
