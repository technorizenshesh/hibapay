import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_wallet_transaction_model.dart';
import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController extends GetxController {
  final count = 0.obs;

  List listOfTra = [
    {
      'title': 'Rewards',
      'sub_title': 'Loyal user rewards!😘',
      'time': '5m ago',
      'icon': 'assets/icons/ic_withdraw.svg'
    },
    {
      'title': 'Money Transfer',
      'sub_title': 'You have successfully sent money to Maria of...',
      'time': '25m ago',
      'icon': 'assets/icons/ic_deposit.svg'
    },
    {
      'title': 'Payment Notification',
      'sub_title': 'Successfully paid!🤑',
      'time': 'Mar 20',
      'icon': 'assets/icons/ic_withdraw.svg'
    },
  ];

  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;

  List<GetWalletTransactionResult> getWalletTransactionResult = [];

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

  clickOnListTile({required int index}) {
    Get.bottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Text(
                StringConstants.detail,
                style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(Get.context!).primaryColor,
                    ),
              ),
              SizedBox(height: 14.px),
              if (getWalletTransactionResult[index].walTraMessage != null &&
                  getWalletTransactionResult[index].walTraMessage!.isNotEmpty)
                listTileView(
                    title: StringConstants.message,
                    trailing:
                        getWalletTransactionResult[index].walTraMessage ?? ''),
              if (getWalletTransactionResult[index].walTraDescription != null &&
                  getWalletTransactionResult[index]
                      .walTraDescription!
                      .isNotEmpty)
                listTileView(
                    title: StringConstants.description,
                    trailing:
                        getWalletTransactionResult[index].walTraDescription ??
                            ''),
              if (getWalletTransactionResult[index].walTraCustomerName !=
                      null &&
                  getWalletTransactionResult[index]
                      .walTraCustomerName!
                      .isNotEmpty)
                listTileView(
                    title: StringConstants.customerName,
                    trailing:
                        getWalletTransactionResult[index].walTraCustomerName ??
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
              if (getWalletTransactionResult[index].walTraServiceType != null &&
                  getWalletTransactionResult[index]
                      .walTraServiceType!
                      .isNotEmpty)
                listTileView(
                    title: StringConstants.serviceType,
                    trailing:
                        getWalletTransactionResult[index].walTraServiceType ??
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
              if (getWalletTransactionResult[index].walTraCurrency != null &&
                  getWalletTransactionResult[index].walTraCurrency!.isNotEmpty)
                listTileView(
                    title: StringConstants.currency,
                    trailing:
                        getWalletTransactionResult[index].walTraCurrency ?? ''),
              if (getWalletTransactionResult[index].walTraTransactionValue !=
                      null &&
                  getWalletTransactionResult[index]
                      .walTraTransactionValue!
                      .isNotEmpty)
                listTileView(
                    curValue: true,
                    title: StringConstants.transactionValue,
                    trailing: getWalletTransactionResult[index]
                            .walTraTransactionValue ??
                        ''),
              /*  if (getWalletTransactionResult[index].walTraTransactionValue !=
                      null &&
                  getWalletTransactionResult[index]
                      .walTraTransactionValue!
                      .isNotEmpty)
                listTileView(
                    curValue: true,
                    title: StringConstants.transactionValue,
                    trailing: getWalletTransactionResult[index]
                            .walTraTransactionValue ??
                        ''),*/
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTileView(
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
  }

  onInitWorking() async {
    await getWalletTransactionApi();
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('MMM dd, yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
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
}
