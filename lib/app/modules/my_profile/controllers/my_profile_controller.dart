import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class MyProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTilePersonalInfoTitles = [
    // StringConstants.firstName,
    StringConstants.fullName,
    StringConstants.dateOfBirth,
    StringConstants.streetAddress,
    StringConstants.city,
    StringConstants.country,
  ];

  final switchValue = false.obs;
  final authTokenHiba = ''.obs;

  List listOfListTileContactInfoTitles = [
    StringConstants.phoneNumber,
    StringConstants.email
  ];

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
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

  clickOnEditProfileButton() async {
    await Get.toNamed(Routes.EDIT_PROFILE);
    onInit();
    increment();
  }

  clickOnListTilePersonalInfo({required int index}) {}

  clickOnDeleteAccountButton() {
    CommonWidgets.showAlertDialog(
      title: 'Delete Info',
      content: 'Delete your account permanently',
      onPressedYes: () async {
        Get.back();
        inAsyncCall.value = true;
        await deleteProfileApi();
        inAsyncCall.value = false;
      },
    );
  }

  deleteProfileApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    UserModel? userModel =
        await ApiMethods.deleteProfile(bodyParams: bodyParams);
    //if (userModel != null) {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    // getServicesResult.clear();
    // getBannersResult.clear();
    // getCardTransactionsResultData.clear();
    // listVirtualCardsResult.clear();
    // getWalletTransactionResult.clear();
    // getReceivedGiftsResult.clear();
    // faqsResult.clear();
    // aboutUsResult.clear();
    // contactUsQuestionsResult.clear();
    // termConditionsResult.clear();
    result = null;
    selectedValue.value = 0;
    isValue.value = false;
    await Get.offAllNamed(Routes.SPLASH);
    //}
  }
}
