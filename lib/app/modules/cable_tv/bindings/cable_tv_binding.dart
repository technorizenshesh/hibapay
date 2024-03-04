import 'package:get/get.dart';

import '../controllers/cable_tv_controller.dart';

class CableTvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CableTvController>(
      () => CableTvController(),
    );
  }
}
