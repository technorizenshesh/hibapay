import 'package:get/get.dart';

import '../controllers/enter_pin_controller.dart';

class EnterPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterPinController>(
      () => EnterPinController(),
    );
  }
}
