import 'package:get/get.dart';

import '../controllers/deposit_in_wallet_controller.dart';

class DepositInWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepositInWalletController>(
      () => DepositInWalletController(),
    );
  }
}
