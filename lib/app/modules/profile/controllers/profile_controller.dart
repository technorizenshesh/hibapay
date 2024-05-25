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
    // IconConstants.icVirtualAccount,
    // IconConstants.icGiftUser,
    // IconConstants.icFund,
    IconConstants.icAccountInfo,
    // IconConstants.icContactPreferences,
    // IconConstants.icGeneralSetting,
    IconConstants.icChangePassword,
    IconConstants.icAboutUs,
    IconConstants.icTermConditions,
    IconConstants.icContactUs,
    IconConstants.icFaqs,
    IconConstants.icReferral,
    // IconConstants.icRateUs,
    IconConstants.icLogout,
  ];

  List listOfListTileTitles = [
    // StringConstants.appearanceAndDisplay,
    // StringConstants.biometricSettings,
    // StringConstants.virtualAccount,
    // StringConstants.giftRedeem,
    // StringConstants.cardBalance,
    StringConstants.accountInfo,
    // StringConstants.contactPreferences,
    // StringConstants.generalSetting,
    StringConstants.changePassword,
    StringConstants.aboutUS,
    StringConstants.termConditions,
    StringConstants.contactUs,
    StringConstants.faqs,
    // StringConstants.rateUs,
    StringConstants.referral,
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
      case StringConstants.virtualAccount:
        Get.toNamed(Routes.VIRTUAL_ACCOUNT);
        break;
      case StringConstants.referral:
        Get.toNamed(Routes.REFERRAL);
        break;
      case StringConstants.cardBalance:
        CommonWidgets.snackBarView(title: 'Coming soon');
        //Get.toNamed(Routes.ACCOUNT);
        break;
      case StringConstants.giftRedeem:
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
      case StringConstants.aboutUS:
        Get.toNamed(Routes.ABOUT_US);
        break;
      case StringConstants.termConditions:
        Get.toNamed(Routes.TERM_AND_CONDITIONS);
        break;
      case StringConstants.contactUs:
        Get.toNamed(Routes.CONTACT_US);
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
        result = null;
        selectedValue.value = 0;
        isValue.value = false;
        await Get.offAllNamed(Routes.SPLASH);
      },
    );
  }
}
