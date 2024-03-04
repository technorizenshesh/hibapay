import 'package:get/get.dart';

import '../controllers/gift_user_controller.dart';

class GiftUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftUserController>(
      () => GiftUserController(),
    );
  }
}
