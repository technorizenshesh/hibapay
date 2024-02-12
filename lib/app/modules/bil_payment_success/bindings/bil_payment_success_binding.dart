import 'package:get/get.dart';

import '../controllers/bil_payment_success_controller.dart';

class BilPaymentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BilPaymentSuccessController>(
      () => BilPaymentSuccessController(),
    );
  }
}
