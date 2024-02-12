import 'package:get/get.dart';

import '../controllers/rent_controller.dart';

class RentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RentController>(
      () => RentController(),
    );
  }
}
