import 'package:get/get.dart';

import '../controllers/receiving_account_controller.dart';

class ReceivingAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivingAccountController>(
      () => ReceivingAccountController(),
    );
  }
}
