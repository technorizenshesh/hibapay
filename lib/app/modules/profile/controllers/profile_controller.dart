import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTileImages = [
    IconConstants.icAccountInfo,
    IconConstants.icGeneralSetting,
    IconConstants.icChangePassword,
    IconConstants.icFaqs,
    IconConstants.icRateUs
  ];

  List listOfListTileTitles = [
    StringConstants.accountInfo,
    StringConstants.generalSetting,
    StringConstants.changePassword,
    StringConstants.faqs,
    StringConstants.rateUs,
  ];

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
    switch (index) {
      case 0:
        Get.toNamed(Routes.MY_PROFILE);
        break;
      case 1:
        Get.toNamed(Routes.GENERAL_SETTING);
        break;
      case 2:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 3:
        Get.toNamed(Routes.FAQS);
        break;
      case 4:
        Get.toNamed(Routes.RATE_US);
        break;
    }
  }
}
