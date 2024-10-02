import 'dart:async';

import 'package:HibaPay/app/app_controller/ac.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/modules/gift_user_cards/controllers/gift_user_cards_controller.dart';
import 'package:HibaPay/app/modules/gift_user_cards/views/gift_user_cards_view.dart';
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
        return const HomeView();
      case 1:
        Get.delete<GiftUserCardsController>();
        Get.lazyPut<GiftUserCardsController>(
          () => GiftUserCardsController(),
        );
        return const GiftUserCardsView();
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
