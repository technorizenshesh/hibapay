import 'package:get/get.dart';

import '../controllers/withdraw_from_wallet_controller.dart';

class WithdrawFromWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawFromWalletController>(
      () => WithdrawFromWalletController(),
    );
  }
}
