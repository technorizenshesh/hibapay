import 'dart:async';

import 'package:HibaPay/app/app_controller/ac.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/modules/my_card/controllers/my_card_controller.dart';
import 'package:HibaPay/app/modules/my_card/views/my_card_view.dart';
import 'package:HibaPay/app/modules/profile/controllers/profile_controller.dart';
import 'package:HibaPay/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:HibaPay/app/modules/wallet/views/wallet_view.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class NavBarController extends GetxController {
  final count = 0.obs;
  late StreamSubscription streamSubscription;

  @override
  void onInit() {
    super.onInit();
    AC().getNetworkConnectionType();
    streamSubscription = AC().checkNetworkConnection();
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
        /*Get.delete<HomeController>();
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );*/
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
        Get.delete<WalletController>();
        Get.lazyPut<WalletController>(
          () => WalletController(),
        );
        return const WalletView();
      case 3:
        Get.delete<ProfileController>();
        Get.lazyPut<ProfileController>(
          () => ProfileController(),
        );
        return const ProfileView();
    }
  }

  onWillPopMethod() {
    print('selectedIndex.value::::::::::::::::${selectedIndex.value}');
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
