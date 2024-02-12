import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class VerifyIdentityController extends GetxController {
  //TODO: Implement VerifyIdentityController

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

  clickOnVerifyMyIdentityButton() {
    Get.toNamed(Routes.VERIFY_IDENTITY_SUCCESS);
  }
}
