import 'package:get/get.dart';

import '../controllers/check_your_mail_controller.dart';

class CheckYourMailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckYourMailController>(
      () => CheckYourMailController(),
    );
  }
}
