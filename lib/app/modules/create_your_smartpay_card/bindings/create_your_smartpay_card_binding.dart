import 'package:get/get.dart';

import '../controllers/create_your_smartpay_card_controller.dart';

class CreateYourSmartpayCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateYourSmartpayCardController>(
      () => CreateYourSmartpayCardController(),
    );
  }
}
