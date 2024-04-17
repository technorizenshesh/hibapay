import 'package:get/get.dart';

import '../controllers/internet_controller.dart';

class InternetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetController>(
      () => InternetController(),
    );
  }
}
