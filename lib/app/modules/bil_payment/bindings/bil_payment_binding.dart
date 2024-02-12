import 'package:get/get.dart';

import '../controllers/bil_payment_controller.dart';

class BilPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BilPaymentController>(
      () => BilPaymentController(),
    );
  }
}
