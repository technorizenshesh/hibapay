import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_wallet_transaction_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
  final count = 0.obs;
  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
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

  clickOnReceivingAccount() {
    Get.toNamed(Routes.RECEIVING_ACCOUNT);
  }

  clickOnDeposit() async {
    await Get.toNamed(Routes.DEPOSIT_IN_WALLET);
    await onInit();
  }

  getProfileApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    UserModel? userModel = await ApiMethods.getProfile(bodyParams: bodyParams);
    if (userModel != null && userModel.result != null) {
      result = userModel.result!;
      increment();
    }
  }

  getWalletTransactionApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    GetWalletTransactionModel? getWalletTransactionModel =
        await ApiMethods.getWalletTransaction(bodyParams: bodyParams);
    if (getWalletTransactionModel != null &&
        getWalletTransactionModel.result != null) {
      getWalletTransactionResult =
          getWalletTransactionModel.result!.reversed.toList();
      increment();
    }
  }

  clickOnWithdraw() {
    Get.toNamed(Routes.WITHDRAW);
  }

  onInitWorking() async {
    await getProfileApi();
    await getWalletTransactionApi();
  }
}
