import 'package:get/get.dart';

import '../controllers/electricity_controller.dart';

class ElectricityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElectricityController>(
      () => ElectricityController(),
    );
  }
}
