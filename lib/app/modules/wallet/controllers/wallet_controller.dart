import 'dart:convert';
import 'dart:ui';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_wallet_transaction_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
  final count = 0.obs;
  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;

  FocusNode focusMoney = FocusNode();
  TextEditingController addMoneyController = TextEditingController();
  final isMoney = true.obs;

  List<GetWalletTransactionResult> getWalletTransactionResult = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    startListener();
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

  void startListener() {
    focusMoney.addListener(onFocusChange);
  }

  void onFocusChange() {
    isMoney.value = focusMoney.hasFocus;
  }

  clickOnFundWallet() async {
    Get.toNamed(Routes.ADD_MONEY_WALLET);
    /* if (result != null &&
        result?.udocSelfyPhotoStatus != null &&
        result!.udocSelfyPhotoStatus!.isNotEmpty) {
      Get.toNamed(Routes.VIRTUAL_ACCOUNT);
    } else {
      if (result != null && result!.id != null && result!.id!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.userId, result?.id ?? '');
        Get.toNamed(Routes.VERIFY_IDENTITY);
      }
    }
    await onInit();*/
    /*showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
            content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How much money would you like to add to your wallet?',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 14.px),
            ),
            SizedBox(height: 20.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: focusMoney,
              title: StringConstants.addAmount,
              controller: addMoneyController,
              isCard: true */ /*isMoney.value*/ /*,
              hintText: StringConstants.pleaseEnterAmount,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(height: 20.px),
            GestureDetector(
              onTap: () => clickOnAddMoney(),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.px, vertical: 8.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.px),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonMethods.textViewLinearGradient(
                        text: StringConstants.addMoneyText, value: true),
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );*/
  }

  clickOnAddMoney() {
    if (addMoneyController.text.trim().isNotEmpty) {
      Get.bottomSheet(
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.px),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account transfer',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 20.px,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                    ),
                    IconButton(
                      onPressed: () => clickOnCrossIcon(),
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(Get.context!).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*CommonMethods.appIcons(
                      assetName: IconConstants.icCur,
                      width: 16.px,
                      color:
                          Theme.of(Get.context!).textTheme.titleMedium?.color,
                      height: 16.px),*/
                    Flexible(
                      child: Text(
                        'Transfer ${addMoneyController.text} NGN to the account below for this phone number only session expires in 30 min.',
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.px),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.px),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topRight,
                          begin: Alignment.bottomLeft,
                          colors: [
                            Theme.of(Get.context!).colorScheme.secondary,
                            Theme.of(Get.context!).colorScheme.onSecondary,
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.px),
                        ),
                        border: Border.all(
                          width: .4.px,
                          color: Theme.of(Get.context!)
                              .scaffoldBackgroundColor
                              .withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.virtualAccount,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        // fontSize: 20.px,
                                        color: Theme.of(Get.context!)
                                            .scaffoldBackgroundColor,
                                      ),
                                ),
                                Text(
                                  /* result?.virtualAccountDataBankName ??*/
                                  'Bank Sterling bank',
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        // fontSize: 20.px,
                                        color: Theme.of(Get.context!)
                                            .scaffoldBackgroundColor,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14.px),
                            Container(
                              padding: EdgeInsets.all(10.px),
                              decoration: BoxDecoration(
                                color: Theme.of(Get.context!)
                                    .scaffoldBackgroundColor
                                    .withOpacity(.2.px),
                                borderRadius: BorderRadius.circular(30.px),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    /*result?.virtualAccountDataAccountNumber ??*/
                                    '9895376758',
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          // fontSize: 20.px,
                                          color: Theme.of(Get.context!)
                                              .scaffoldBackgroundColor,
                                        ),
                                  ),
                                  SizedBox(width: 8.px),
                                  GestureDetector(
                                    onTap: () => clickOnCopyIcon(),
                                    child: CommonMethods.appIcons(
                                      assetName: IconConstants.icCopyWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 14.px),
                            Text(
                              'Hiba pay',
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    // fontSize: 20.px,
                                    color: Theme.of(Get.context!)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                          ]),
                    ),
                  ),
                ),
                const Spacer(),
                CommonWidgets.commonElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'I have made the transfer',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 14.px),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Change Method',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(Get.context!).primaryColor),
                  ),
                ),
                SizedBox(height: 14.px),
              ],
            ),
          ),
        ),
      ).whenComplete(() {
        addMoneyController.clear();
      });
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnCopyIcon() async {
    await Clipboard.setData(
      ClipboardData(
        text: result?.virtualAccountDataBank ?? '',
      ),
    );
    Get.snackbar(
        margin: EdgeInsets.all(20.px), 'Massage', 'Copied to your clipboard !');
  }

  getProfileApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    UserModel? userModel = await ApiMethods.getProfile(bodyParams: bodyParams);
    if (userModel != null && userModel.result != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(ApiKeyConstants.result, jsonEncode(userModel.result ?? ''));
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

/*  Widget listTileView(
      {required String trailing, required String title, bool? curValue}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (curValue ?? false)
            CommonMethods.appIcons(
                height: 14.px,
                width: 14.px,
                assetName: IconConstants.icCur,
                color: Theme.of(Get.context!).textTheme.titleMedium?.color),
          Text(
            trailing,
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }*/

  Widget listTileView(
      {required String trailing, required String title, bool? curValue}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.px),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (curValue ?? false)
                  CommonMethods.appIcons(
                      height: 14.px,
                      width: 14.px,
                      assetName: IconConstants.icCur,
                      color:
                          Theme.of(Get.context!).textTheme.titleMedium?.color),
                Flexible(
                  child: Text(
                    trailing,
                    maxLines: 2,
                    textAlign: TextAlign.right,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  clickOnListTile({required int index}) {
    if (getWalletTransactionResult[index].walTraBuyPostServiceId == '0003') {
      Get.toNamed(Routes.WALLET_TRANSACTION_DETAIL,
          arguments: {'index': index});
    } else {
      Get.bottomSheet(
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.px),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    StringConstants.transactionDetail,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                          fontSize: 20.px,
                          color: Theme.of(Get.context!).primaryColor,
                        ),
                  ),
                  SizedBox(height: 14.px),
                  if (getWalletTransactionResult[index].walTraCustomerName !=
                          null &&
                      getWalletTransactionResult[index]
                          .walTraCustomerName!
                          .isNotEmpty)
                    listTileView(
                        title: StringConstants.customerName,
                        trailing: getWalletTransactionResult[index]
                                .walTraCustomerName ??
                            ''),
                  if (getWalletTransactionResult[index].walTraTransactionType !=
                          null &&
                      getWalletTransactionResult[index]
                          .walTraTransactionType!
                          .isNotEmpty)
                    listTileView(
                        title: StringConstants.transactionType,
                        trailing: getWalletTransactionResult[index]
                                .walTraTransactionType ??
                            ''),
                  if (getWalletTransactionResult[index].walTraServiceType !=
                          null &&
                      getWalletTransactionResult[index]
                          .walTraServiceType!
                          .isNotEmpty)
                    listTileView(
                        title: StringConstants.serviceType,
                        trailing: getWalletTransactionResult[index]
                                .walTraServiceType ??
                            ''),
                  if (getWalletTransactionResult[index].walTraTransactionDate !=
                          null &&
                      getWalletTransactionResult[index]
                          .walTraTransactionDate!
                          .isNotEmpty)
                    listTileView(
                        title: StringConstants.transactionDate,
                        trailing: getWalletTransactionResult[index]
                                .walTraTransactionDate ??
                            ''),
                  if (getWalletTransactionResult[index].walTraCurrency !=
                          null &&
                      getWalletTransactionResult[index]
                          .walTraCurrency!
                          .isNotEmpty)
                    listTileView(
                        title: StringConstants.currency,
                        trailing:
                            getWalletTransactionResult[index].walTraCurrency ??
                                ''),
                  if (getWalletTransactionResult[index]
                              .walTraTransactionValue !=
                          null &&
                      getWalletTransactionResult[index]
                          .walTraTransactionValue!
                          .isNotEmpty)
                    listTileView(
                      curValue: true,
                      title: StringConstants.transactionValue,
                      trailing:
                          '${double.parse(getWalletTransactionResult[index].walTraTransactionValue ?? '0') + double.parse(getWalletTransactionResult[index].walTraTransactionAppFee ?? '0')}',
                    ),
                  SizedBox(height: 14.px),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  clickOnCrossIcon() {
    Get.back();
  }
}
