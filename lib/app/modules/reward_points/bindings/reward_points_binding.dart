import 'package:get/get.dart';

import '../controllers/reward_points_controller.dart';

class RewardPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardPointsController>(
      () => RewardPointsController(),
    );
  }
}
