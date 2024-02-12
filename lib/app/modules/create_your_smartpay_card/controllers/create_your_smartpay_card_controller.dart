import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class CreateYourSmartpayCardController extends GetxController {
  //TODO: Implement CreateYourSmartpayCardController

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

  clickOnGetFreeCardButton() {
    Get.toNamed(Routes.ADD_NEW_CARD);
  }
}
