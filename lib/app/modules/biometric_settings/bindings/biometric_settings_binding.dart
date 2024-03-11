import 'package:get/get.dart';

import '../controllers/biometric_settings_controller.dart';

class BiometricSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiometricSettingsController>(
      () => BiometricSettingsController(),
    );
  }
}
