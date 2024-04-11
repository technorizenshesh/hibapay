import 'package:get/get.dart';

import '../controllers/create_virtual_card_controller.dart';

class CreateVirtualCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateVirtualCardController>(
      () => CreateVirtualCardController(),
    );
  }
}
