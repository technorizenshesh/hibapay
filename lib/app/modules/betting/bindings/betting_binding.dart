import 'package:get/get.dart';

import '../controllers/betting_controller.dart';

class BettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BettingController>(
      () => BettingController(),
    );
  }
}
