import 'package:get/get.dart';

import '../controllers/pay_summary_success_controller.dart';

class PaySummarySuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaySummarySuccessController>(
      () => PaySummarySuccessController(),
    );
  }
}
