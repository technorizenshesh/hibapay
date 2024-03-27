import 'package:get/get.dart';
import 'package:hibapay/app/modules/account/controllers/account_controller.dart';
import 'package:hibapay/app/modules/account/views/account_view.dart';
import 'package:hibapay/app/modules/home/controllers/home_controller.dart';
import 'package:hibapay/app/modules/my_card/controllers/my_card_controller.dart';
import 'package:hibapay/app/modules/my_card/views/my_card_view.dart';
import 'package:hibapay/app/modules/profile/controllers/profile_controller.dart';
import 'package:hibapay/app/modules/scan_qr_code/views/scan_qr_code_view.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

final selectedIndex = 0.obs;

class NavBarController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  body() {
    switch (selectedIndex.value) {
      case 0:
        Get.delete<HomeController>();
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
        return const HomeView();
      case 1:
        Get.delete<MyCardController>();
        Get.lazyPut<MyCardController>(
          () => MyCardController(),
        );
        return const MyCardView();
      case 2:
        return const ScanQrCodeView();
      case 3:
        Get.delete<AccountController>();
        Get.lazyPut<AccountController>(
          () => AccountController(),
        );
        return const AccountView();
      case 4:
        Get.delete<ProfileController>();
        Get.lazyPut<ProfileController>(
          () => ProfileController(),
        );
        return const ProfileView();
    }
  }
}
