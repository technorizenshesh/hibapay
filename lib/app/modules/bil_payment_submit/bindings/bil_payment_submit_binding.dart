import 'package:get/get.dart';

import '../controllers/bil_payment_submit_controller.dart';

class BilPaymentSubmitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BilPaymentSubmitController>(
      () => BilPaymentSubmitController(),
    );
  }
}
