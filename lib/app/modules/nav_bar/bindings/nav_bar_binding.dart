import 'package:get/get.dart';
import 'package:hibapay/app/modules/account/controllers/account_controller.dart';
import 'package:hibapay/app/modules/my_card/controllers/my_card_controller.dart';
import 'package:hibapay/app/modules/scan_qr_code/controllers/scan_qr_code_controller.dart';
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
    Get.lazyPut<MyCardController>(
      () => MyCardController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
