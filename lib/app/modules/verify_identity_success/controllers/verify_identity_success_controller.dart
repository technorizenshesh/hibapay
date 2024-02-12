import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class VerifyIdentitySuccessController extends GetxController {
  //TODO: Implement VerifyIdentitySuccessController

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

  clickOnNextButton() {
    Get.toNamed(Routes.NAV_BAR);
  }
}
