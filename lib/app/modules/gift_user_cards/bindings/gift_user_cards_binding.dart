import 'package:get/get.dart';

import '../controllers/gift_user_cards_controller.dart';

class GiftUserCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftUserCardsController>(
      () => GiftUserCardsController(),
    );
  }
}
