import 'package:get/get.dart';

import '../controllers/contact_preferences_controller.dart';

class ContactPreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactPreferencesController>(
      () => ContactPreferencesController(),
    );
  }
}
