import 'package:get/get.dart';

import '../controllers/verify_identity_controller.dart';

class VerifyIdentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyIdentityController>(
      () => VerifyIdentityController(),
    );
  }
}
