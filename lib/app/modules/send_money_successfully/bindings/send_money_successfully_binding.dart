import 'package:get/get.dart';

import '../controllers/send_money_successfully_controller.dart';

class SendMoneySuccessfullyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendMoneySuccessfullyController>(
      () => SendMoneySuccessfullyController(),
    );
  }
}
