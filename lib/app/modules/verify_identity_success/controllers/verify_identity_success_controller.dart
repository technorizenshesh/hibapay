import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyIdentitySuccessController extends GetxController {
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
    Get.offAllNamed(Routes.LOGIN);
  }
}
