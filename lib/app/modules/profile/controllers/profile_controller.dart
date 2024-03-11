import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTileImages = [
    IconConstants.icAppearanceAndDisplay,
    IconConstants.icBiometricSettings,
    IconConstants.icReferral,
    IconConstants.icGiftUser,
    IconConstants.icAccountInfo,
    IconConstants.icContactPreferences,
    IconConstants.icGeneralSetting,
    IconConstants.icChangePassword,
    IconConstants.icFaqs,
    IconConstants.icRateUs
  ];

  List listOfListTileTitles = [
    StringConstants.appearanceAndDisplay,
    StringConstants.biometricSettings,
    StringConstants.referral,
    StringConstants.giftUser,
    StringConstants.accountInfo,
    StringConstants.contactPreferences,
    StringConstants.generalSetting,
    StringConstants.changePassword,
    StringConstants.faqs,
    StringConstants.rateUs,
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

  clickOnListTile({required int index}) {
    switch (listOfListTileTitles[index]) {
      case StringConstants.biometricSettings:
        Get.toNamed(Routes.BIOMETRIC_SETTINGS);
        break;
      case StringConstants.referral:
        Get.toNamed(Routes.REFERRAL);
        break;
      case StringConstants.giftUser:
        Get.toNamed(Routes.GIFT_USER_CARDS);
        break;
      case StringConstants.accountInfo:
        Get.toNamed(Routes.MY_PROFILE);
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
    }
  }

  clickOnCard() {
    Get.toNamed(Routes.REWARD_POINTS);
  }
}
