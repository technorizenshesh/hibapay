import 'package:get/get.dart';

import '../controllers/spinner_controller.dart';

class SpinnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpinnerController>(
      () => SpinnerController(),
    );
  }
}
