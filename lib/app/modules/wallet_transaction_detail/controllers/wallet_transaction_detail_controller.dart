import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_live_transaction_details_model.dart';
import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletTransactionDetailController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, dynamic> arguments = Get.arguments;
  final index = 0.obs;
  final authTokenHiba = ''.obs;
  GetLiveTransactionDetailsResultData? getLiveTransactionDetailsResultData;

  @override
  Future<void> onInit() async {
    super.onInit();
    index.value = arguments['index'] ?? 0;
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    inAsyncCall.value = true;
    await onInitWork();
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

  String formatDate(String dateString) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Define the desired output format
    DateFormat formatter = DateFormat('MMM dd, yyyy');

    // Format the DateTime object using the formatter
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  Widget listTileView(
      {required String trailing1,
      required String title1,
      required String trailing,
      required String title,
      bool? curValue}) {
    return Row(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
            ),
            Text(
              title1,
              style: Theme.of(Get.context!)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              trailing,
              style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (curValue ?? false)
                  CommonMethods.appIcons(
                      height: 14.px,
                      width: 14.px,
                      assetName: IconConstants.icCur,
                      color:
                          Theme.of(Get.context!).textTheme.titleMedium?.color),
                Expanded(
                  child: Text(
                    trailing1,
                    maxLines: 4,
                    textAlign: TextAlign.end,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  clickOnView() {
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
                    StringConstants.tokenDetails,
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
              Text(
                'Here is your token',
                style: Theme.of(Get.context!)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 14.px),
              Text(
                getLiveTransactionDetailsResultData != null &&
                        getLiveTransactionDetailsResultData!.token != null &&
                        getLiveTransactionDetailsResultData!.token!.isNotEmpty
                    ? getLiveTransactionDetailsResultData!.token!
                    : 'Not generated token',
                textAlign: TextAlign.center,
                style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(Get.context!).primaryColor,
                    ),
              ),
              SizedBox(height: 20.px),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.px),
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      Theme.of(Get.context!)
                          .colorScheme
                          .secondary
                          .withOpacity(.44),
                      Theme.of(Get.context!)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.44),
                    ],
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter the 20 digit code on your meter to recharge.',
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 12.px,
                                color: Theme.of(Get.context!).primaryColor),
                      ),
                    ]),
              ),
              const Spacer(),
              CommonWidgets.commonElevatedButton(
                onPressed: () => clickOnShare(),
                child: Text(
                  StringConstants.share,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  clickOnCrossIcon() {
    Get.back();
  }

  clickOnShare() async {
    SocialShare.shareOptions(
      getLiveTransactionDetailsResultData != null &&
              getLiveTransactionDetailsResultData!.token != null &&
              getLiveTransactionDetailsResultData!.token!.isNotEmpty
          ? getLiveTransactionDetailsResultData!.token!
          : 'Not generated token',
    );
  }

  Future<void> clickOnDownloadButton() async {
    if (!await launchUrl(Uri.parse(
        'https://hibapay.co/invoice?id=${getWalletTransactionResult[index.value].walTraId ?? ''}'))) {
      throw Exception(
          'Could not launch ${'https://hibapay.co/invoice?id=${getWalletTransactionResult[index.value].walTraId ?? ''}'}');
    }
  }

  onInitWork() async {
    await getLiveTransactionDetailsApi();
  }

  getLiveTransactionDetailsApi() async {
    inAsyncCall.value = true;
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.reference:
          getWalletTransactionResult[index.value].walTraBuyDataReference ?? '',
    };
    GetLiveTransactionDetailsModel? getLiveTransactionDetailsModel =
        await ApiMethods.getLiveTransactionDetails(bodyParams: bodyParams);
    if (getLiveTransactionDetailsModel != null &&
        getLiveTransactionDetailsModel.result != null &&
        getLiveTransactionDetailsModel.result!.data != null) {
      getLiveTransactionDetailsResultData =
          getLiveTransactionDetailsModel.result!.data!;
      increment();
    }
    inAsyncCall.value = false;
  }
}
