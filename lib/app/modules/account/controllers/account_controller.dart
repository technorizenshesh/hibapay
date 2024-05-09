import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/fund_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_holder_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_transactions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  final count = 0.obs;
  final cardIndex = 0.obs;
  bool showAvg = false;

  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;
  final virtualCardId = ''.obs;
  final balance = ''.obs;

  GetCardTransactionsResult? getCardTransactionsResult;

  List<GetCardTransactionsResultData> getCardTransactionsResultData = [];

  Map<String, dynamic> bodyParams = {};

  FundVirtualCardResult? result;
  GetCardHolderResult? getCardHolderResult;

  List<ListVirtualCardsResult> listVirtualCardsResult = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    virtualCardId.value = sp.getString(ApiKeyConstants.virtualCardId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
  }

  onInitWorking() async {
    await getCardTransactionsApi();
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

  clickOnAddAccount() {
    Get.toNamed(Routes.ADD_NEW_BANK);
  }

  clickOnSwitch() {}

  clickOnDeposit() async {
    if (listVirtualCardsResult.isNotEmpty && virtualCardId.value.isNotEmpty) {
      Get.toNamed(Routes.DEPOSIT);
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'Something went wrong',
          'Please add virtual account and card');
      await getCardHolderApi();
    }
  }

  clickOnWithdraw() async {
    if (listVirtualCardsResult.isNotEmpty && virtualCardId.value.isNotEmpty) {
      Get.toNamed(Routes.WITHDRAW);
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'Something went wrong',
          'Please add virtual account and card');
      await getCardHolderApi();
    }
  }

  getCardTransactionsApi() async {
    if (listVirtualCardsResult.isNotEmpty) {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
        ApiKeyConstants.virtualCardId:
            listVirtualCardsResult.first.vcardCardId ?? '',
      };
      GetCardTransactionsModel? getCardTransactionsModel =
          await ApiMethods.getCardTransactions(bodyParams: bodyParams);
      if (getCardTransactionsModel != null &&
          getCardTransactionsModel.result != null) {
        getCardTransactionsResult = getCardTransactionsModel.result!;
        if (getCardTransactionsResult != null &&
            getCardTransactionsResult!.data != null &&
            getCardTransactionsResult!.data!.isNotEmpty) {
          getCardTransactionsResultData = getCardTransactionsResult!.data!;
          print(
              'getCardTransactionsResultData.first.amount:::::::::::::${getCardTransactionsResultData.first.amount}');
          if (getCardTransactionsResultData.isNotEmpty) {
            balance.value = getCardTransactionsResultData.first.amount ?? '';
            increment();
          }
        }
        increment();
      }
    } else {
      //Get.snackbar(margin: EdgeInsets.all(20.px), 'Error', 'List empty');
    }
  }

  getCardHolderApi() async {
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    GetCardHolderModel? getCardHolderModel =
        await ApiMethods.getCardHolder(bodyParams: bodyParams);
    if (getCardHolderModel != null && getCardHolderModel.result != null) {
      getCardHolderResult = getCardHolderModel.result;
      if (getCardHolderResult != null &&
          getCardHolderResult!.cchCardHolderId != null &&
          getCardHolderResult!.cchCardHolderId!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.cardHolderId,
            getCardHolderResult!.cchCardHolderId!);
        await Get.toNamed(Routes.CREATE_VIRTUAL_CARD);
        await onInit();
      }
      increment();
    } else {
      await Get.toNamed(Routes.CREATE_CARD_HOLDER);
      await onInit();
    }
  }
}
