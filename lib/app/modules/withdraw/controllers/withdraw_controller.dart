import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/fund_virtual_card_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_transactions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';

class WithdrawController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;
  final virtualCardId = ''.obs;

  FundVirtualCardResult? result;
  FundVirtualCardResult? resultWithdraw;

  final isAmount = false.obs;
  FocusNode focusAmount = FocusNode();
  TextEditingController amountController = TextEditingController();

  final balance = ''.obs;

  GetCardTransactionsResult? getCardTransactionsResult;

  List<GetCardTransactionsResultData> getCardTransactionsResultData = [];

  List<ListVirtualCardsResult> listVirtualCardsResult = [];

  List<String> percentageList = ['25', '50', '75', '100'];

  final selectedValue = 0.obs;
  GetCardTransactionsModel? getCardTransactionsModel;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    virtualCardId.value = sp.getString(ApiKeyConstants.virtualCardId) ?? '';
    super.onInit();
    startListener();
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
  }

  void startListener() {
    focusAmount.addListener(onFocusChange);
  }

  void onFocusChange() {
    isAmount.value = focusAmount.hasFocus;
  }

  onInitWorking() async {
    await getCardTransactionsApi();
    await listVirtualCardsApi();
  }

/*
  fundVirtualCardApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.virtualCardId: virtualCardId.value,
      ApiKeyConstants.virtualCardFundingCurrency: 'NGN',
    };
    FundVirtualCardModel? fundVirtualCardModel =
        await ApiMethods.fundVirtualCard(bodyParams: bodyParams);
    if (fundVirtualCardModel != null && fundVirtualCardModel.result != null) {
      result = fundVirtualCardModel.result!;
      if (result != null &&
          result!.data != null &&
          result!.data!.balance != null &&
          result!.data!.balance!.isNotEmpty) {
        balance.value = result!.data!.balance!;
      }
      increment();
    }
  }
*/

  getCardTransactionsApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.virtualCardId: virtualCardId.value,
    };
    getCardTransactionsModel =
        await ApiMethods.getCardTransactions(bodyParams: bodyParams);
    if (getCardTransactionsModel != null &&
        getCardTransactionsModel!.result != null) {
      getCardTransactionsResult = getCardTransactionsModel!.result!;
      if (getCardTransactionsResult != null &&
          getCardTransactionsResult!.data != null &&
          getCardTransactionsResult!.data!.isNotEmpty) {
        getCardTransactionsResultData = getCardTransactionsResult!.data!;
        print(
            'getCardTransactionsResultData.first.amount:::::::::::::${getCardTransactionsResultData.first.amount}');
        if (getCardTransactionsResultData.isNotEmpty) {
          balance.value = getCardTransactionsResultData.first.amount ?? '';
          clickOnPercentage(index: 0);
          increment();
        }
      }
      increment();
    }
  }

  listVirtualCardsApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    ListVirtualCardsModel? listVirtualCardsModel =
        await ApiMethods.listVirtualCards(bodyParams: bodyParams);
    listVirtualCardsResult.clear();
    if (listVirtualCardsModel != null &&
        listVirtualCardsModel.result != null &&
        listVirtualCardsModel.result!.isNotEmpty) {
      listVirtualCardsResult = listVirtualCardsModel.result!;
      increment();
    }
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

  clickOnWithdrawButton1() {
    showModalBottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      context: Get.context!,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                StringConstants.selectYourBank,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 14.px),
              ListTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.px),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: .4.px,
                  ),
                ),
                trailing:
                    CommonMethods.appIcons(assetName: IconConstants.icCheck),
                subtitle: Text(
                  '**** **** **** 1121',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                title: Text(
                  'Bank of America',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).primaryColor),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24.px),
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    height: 48.px,
                    width: 48.px,
                  ),
                ),
              ),
              SizedBox(height: 14.px),
              ListTile(
                trailing: CommonMethods.appIcons(
                    assetName: IconConstants.icRightArrow),
                title: Text(
                  StringConstants.addNewBank,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).primaryColor),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24.px),
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    height: 18.px,
                    width: 18.px,
                  ),
                ),
              ),
              SizedBox(height: 14.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => clickOnConfirmButton(),
                child: Text(
                  StringConstants.confirm,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      ),
    );
  }

  clickOnWithdrawButton() async {
    if (amountController.text.isNotEmpty) {
      if (/*double.parse(balance.value)*/ 1000 >=
          double.parse(amountController.text)) {
        inAsyncCall.value = true;
        await withdrawVirtualCardBalanceApi();
        inAsyncCall.value = false;
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px),
            'Error',
            'Minimum withdrawal should be 1000');
      }
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'Something went wrong',
          'Amount field required');
    }
  }

  withdrawVirtualCardBalanceApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.virtualCardId: virtualCardId.value,
      ApiKeyConstants.virtualCardFundingCurrency: 'NGN',
      ApiKeyConstants.withdrawalAmount: amountController.text.toString(),
    };
    FundVirtualCardModel? fundVirtualCardModel =
        await ApiMethods.withdrawVirtualCardBalance(bodyParams: bodyParams);
    if (fundVirtualCardModel != null && fundVirtualCardModel.result != null) {
      resultWithdraw = fundVirtualCardModel.result!;
      if (resultWithdraw != null &&
          resultWithdraw!.data != null &&
          resultWithdraw!.data!.balance != null &&
          resultWithdraw!.data!.balance!.isNotEmpty) {
        // balance.value = resultWithdraw!.data!.balance!;
        Get.back();
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Successfully', 'Payment withdraw');
      }
      increment();
    }
  }

  clickOnConfirmButton() {
    Get.back();
  }

  clickOnPercentage({required int index}) {
    selectedValue.value = index;
    amountController.text = (double.parse(balance.value) *
            (double.parse(percentageList[index]) / 100))
        .toStringAsFixed(2);
    increment();
  }
}
