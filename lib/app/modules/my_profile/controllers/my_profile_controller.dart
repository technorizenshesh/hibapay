import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class MyProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTilePersonalInfoTitles = [
    StringConstants.firstName,
    StringConstants.lastName,
    StringConstants.dateOfBirth,
    StringConstants.streetAddress,
    StringConstants.city,
    StringConstants.country,
  ];

  final switchValue = false.obs;

  List listOfListTileContactInfoTitles = [
    StringConstants.phoneNumber,
    StringConstants.email
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

  clickOnEditProfileButton() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  clickOnListTilePersonalInfo({required int index}) {}

  clickOnDeleteAccountButton() {
    CommonWidgets.showAlertDialog(
      title: 'Delete Info',
      content: 'Delete your account permanently',
      onPressedYes: () {
        Get.back();
      },
    );
  }
}
