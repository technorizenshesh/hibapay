import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
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

  clickOnReceivingAccount() {
    Get.toNamed(Routes.RECEIVING_ACCOUNT);
  }

  clickOnSwitch() {}

  clickOnDeposit() {
    Get.toNamed(Routes.DEPOSIT);
  }

  clickOnWithdraw() {
    Get.toNamed(Routes.WITHDRAW);
  }
}
