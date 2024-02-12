import 'package:get/get.dart';

import '../controllers/pay_amount_controller.dart';

class PayAmountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayAmountController>(
      () => PayAmountController(),
    );
  }
}
