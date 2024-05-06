import 'package:get/get.dart';

import '../controllers/term_and_conditions_controller.dart';

class TermAndConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermAndConditionsController>(
      () => TermAndConditionsController(),
    );
  }
}
