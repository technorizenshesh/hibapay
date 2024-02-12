import 'package:get/get.dart';

import '../controllers/verify_identity_success_controller.dart';

class VerifyIdentitySuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyIdentitySuccessController>(
      () => VerifyIdentitySuccessController(),
    );
  }
}
