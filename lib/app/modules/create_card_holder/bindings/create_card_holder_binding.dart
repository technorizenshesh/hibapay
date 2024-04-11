import 'package:get/get.dart';

import '../controllers/create_card_holder_controller.dart';

class CreateCardHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCardHolderController>(
      () => CreateCardHolderController(),
    );
  }
}
