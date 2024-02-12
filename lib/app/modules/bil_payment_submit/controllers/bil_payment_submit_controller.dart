import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class BilPaymentSubmitController extends GetxController {
  //TODO: Implement BilPaymentSubmitController

  final count = 0.obs;

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

  clickOnSubmitButton() {
    Get.toNamed(Routes.BIL_PAYMENT_SUCCESS);
  }
}
