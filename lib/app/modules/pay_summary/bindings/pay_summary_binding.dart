import 'package:get/get.dart';

import '../controllers/pay_summary_controller.dart';

class PaySummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaySummaryController>(
      () => PaySummaryController(),
    );
  }
}
