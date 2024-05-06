import 'package:get/get.dart';

import '../controllers/virtual_account_add_controller.dart';

class VirtualAccountAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VirtualAccountAddController>(
      () => VirtualAccountAddController(),
    );
  }
}
