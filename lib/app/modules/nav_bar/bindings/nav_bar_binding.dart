import 'package:HibaPay/app/modules/account/controllers/account_controller.dart';
import 'package:HibaPay/app/modules/gift_user_cards/controllers/gift_user_cards_controller.dart';
import 'package:HibaPay/app/modules/scan_qr_code/controllers/scan_qr_code_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ScanQrCodeController>(
      () => ScanQrCodeController(),
    );
    Get.lazyPut<GiftUserCardsController>(
      () => GiftUserCardsController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
