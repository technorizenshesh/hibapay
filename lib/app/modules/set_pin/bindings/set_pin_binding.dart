import 'package:get/get.dart';

import '../controllers/set_pin_controller.dart';

class SetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPinController>(
      () => SetPinController(),
    );
  }
}
