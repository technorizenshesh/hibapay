import 'package:get/get.dart';

import '../controllers/my_card_controller.dart';

class MyCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCardController>(
      () => MyCardController(),
    );
  }
}
