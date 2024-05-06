import 'package:get/get.dart';

import '../controllers/wallet_transaction_detail_controller.dart';

class WalletTransactionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTransactionDetailController>(
      () => WalletTransactionDetailController(),
    );
  }
}
