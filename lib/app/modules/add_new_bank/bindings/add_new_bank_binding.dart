import 'package:get/get.dart';

import '../controllers/add_new_bank_controller.dart';

class AddNewBankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewBankController>(
      () => AddNewBankController(),
    );
  }
}
