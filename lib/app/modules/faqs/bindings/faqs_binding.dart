import 'package:get/get.dart';

import '../controllers/faqs_controller.dart';

class FaqsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqsController>(
      () => FaqsController(),
    );
  }
}
