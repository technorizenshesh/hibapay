import 'package:get/get.dart';

import '../controllers/add_money_wallet_controller.dart';

class AddMoneyWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMoneyWalletController>(
      () => AddMoneyWalletController(),
    );
  }
}
