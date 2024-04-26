import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTileImages = [
    // IconConstants.icAppearanceAndDisplay,
    // IconConstants.icBiometricSettings,
    IconConstants.icFund,
    // IconConstants.icReferral,
    IconConstants.icGiftUser,
    IconConstants.icAccountInfo,
    // IconConstants.icContactPreferences,
    // IconConstants.icGeneralSetting,
    IconConstants.icChangePassword,
    IconConstants.icFaqs,
    // IconConstants.icRateUs,
    IconConstants.icLogout,
  ];

  List listOfListTileTitles = [
    // StringConstants.appearanceAndDisplay,
    // StringConstants.biometricSettings,
    StringConstants.fund,
    // StringConstants.referral,
    StringConstants.giftUser,
    StringConstants.accountInfo,
    // StringConstants.contactPreferences,
    // StringConstants.generalSetting,
    StringConstants.changePassword,
    StringConstants.faqs,
    // StringConstants.rateUs,
    StringConstants.logout,
  ];

  final switchValue = false.obs;

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

  clickOnListTile({required int index}) async {
    switch (listOfListTileTitles[index]) {
      case StringConstants.biometricSettings:
        Get.toNamed(Routes.BIOMETRIC_SETTINGS);
        break;
      case StringConstants.referral:
        Get.toNamed(Routes.REFERRAL);
        break;
      case StringConstants.fund:
        Get.toNamed(Routes.ACCOUNT);
        break;
      case StringConstants.giftUser:
        Get.toNamed(Routes.GIFT_USER_CARDS);
        break;
      case StringConstants.accountInfo:
        await Get.toNamed(Routes.MY_PROFILE);
        increment();
        break;
      case StringConstants.generalSetting:
        Get.toNamed(Routes.GENERAL_SETTING);
        break;
      case StringConstants.changePassword:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case StringConstants.faqs:
        Get.toNamed(Routes.FAQS);
        break;
      case StringConstants.rateUs:
        Get.toNamed(Routes.RATE_US);
        break;
      case StringConstants.wallet:
        Get.toNamed(Routes.WALLET);
        break;
      case StringConstants.logout:
        clickOnLogout();
        break;
    }
  }

  clickOnCard() {
    Get.toNamed(Routes.REWARD_POINTS);
  }

  clickOnLogout() async {
    CommonWidgets.showAlertDialog(
      onPressedYes: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        getServicesResult.clear;
        getBannersResult.clear;
        getCardTransactionsResultData.clear;
        listVirtualCardsResult.clear;
        result = null;
        selectedIndex.value = 0;
        Get.offAllNamed(Routes.SPLASH);
      },
    );
  }
}
