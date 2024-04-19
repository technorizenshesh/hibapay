import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/modules/account/controllers/account_controller.dart';
import 'package:HibaPay/app/modules/account/views/account_view.dart';
import 'package:HibaPay/app/modules/home/controllers/home_controller.dart';
import 'package:HibaPay/app/modules/my_card/controllers/my_card_controller.dart';
import 'package:HibaPay/app/modules/my_card/views/my_card_view.dart';
import 'package:HibaPay/app/modules/nav_bar/controllers/nav_bar_controller.dart';
import 'package:HibaPay/app/modules/profile/controllers/profile_controller.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

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
      /* case 2:
        return const ScanQrCodeView();*/
      case 2:
        Get.delete<AccountController>();
        Get.lazyPut<AccountController>(
          () => AccountController(),
        );
        return const AccountView();
      case 3:
        Get.delete<ProfileController>();
        Get.lazyPut<ProfileController>(
          () => ProfileController(),
        );
        return const ProfileView();
    }
  }

  onWillPop() {
    if (selectedIndex.value == 0) {
      CommonWidgets.showAlertDialog(
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndex.value = 0;
    }
  }
}
