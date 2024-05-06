import 'package:get/get.dart';

import '../controllers/virtual_account_controller.dart';

class VirtualAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VirtualAccountController>(
      () => VirtualAccountController(),
    );
  }
}
