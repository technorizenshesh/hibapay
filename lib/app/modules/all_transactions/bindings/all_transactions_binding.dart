import 'package:get/get.dart';

import '../controllers/all_transactions_controller.dart';

class AllTransactionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTransactionsController>(
      () => AllTransactionsController(),
    );
  }
}
