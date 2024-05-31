import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMoneyWalletController extends GetxController {
  final count = 0.obs;
  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;
  FocusNode focusMoney = FocusNode();
  TextEditingController addMoneyController = TextEditingController();
  final isMoney = true.obs;

  final dataNumber = ''.obs;
  final isWaiting = true.obs;
  final dataMessage = ''.obs;
  final bankName = ''.obs;
  final userName = ''.obs;
  final secondsRemaining = (30 * 60).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    startListener();
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    inAsyncCall.value = true;
    await assignUserApi();
    inAsyncCall.value = false;
  }

  assignUserApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    http.Response? response =
        await ApiMethods.assignUser(bodyParams: bodyParams);
    if (response != null) {
      if (jsonDecode(response.body)['result'] != null &&
          jsonDecode(response.body)['result'] != '[]') {
        dataNumber.value = jsonDecode(response.body)['result'];
      }
      bankName.value = jsonDecode(response.body)['bank_name'] ?? '';
      userName.value = jsonDecode(response.body)['user_name'] ?? '';
      dataMessage.value = jsonDecode(response.body)['message'];
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

  void startListener() {
    focusMoney.addListener(onFocusChange);
  }

  void onFocusChange() {
    isMoney.value = focusMoney.hasFocus;
  }

  clickOnAddMoneyButton() {
    if (addMoneyController.text.trim().isNotEmpty &&
        dataNumber.value.isNotEmpty) {
      Get.bottomSheet(
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        Obx(() {
          count.value;
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(16.px),
              child: ListView(
                children: [
                  Column(
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
                      /*Flexible(
                      child: Text(
                        'Transfer ${addMoneyController.text} NGN to the account below for this phone number only session expires in 30 min.',
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 8.px),*/
                      Text(
                        dataMessage.value,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
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
                                  Theme.of(Get.context!)
                                      .colorScheme
                                      .onSecondary,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        bankName.value,
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
                                      borderRadius:
                                          BorderRadius.circular(30.px),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          dataNumber.value,
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
                                            assetName:
                                                IconConstants.icCopyWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 14.px),
                                  Text(
                                    userName.value.isNotEmpty
                                        ? userName.value
                                        : '${result?.firstName ?? ''} ${result?.lastName ?? ''}',
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
                      SizedBox(height: 20.px),
                      Text(
                        'Please wait while we confirm $formattedTimeMethod ( ${addMoneyController.text} NGN) your token will be sent once we receiver your payment.',
                        style: Theme.of(Get.context!).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      if (!isWaiting.value) SizedBox(height: 8.px),
                      if (!isWaiting.value)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.px),
                            border: Border.all(
                              color: Theme.of(Get.context!).primaryColor,
                            ),
                          ),
                          child: Text(
                            'Note : You can close this. Your payment is in progress. If the payment is completed, you will see your history.',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(Get.context!).primaryColor,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      SizedBox(height: 8.px),
                      (isWaiting.value)
                          ? CommonWidgets.commonElevatedButton(
                              onPressed: () {
                                // Get.back();
                                isWaiting.value = false;
                                startTimer();
                              },
                              child: Text(
                                'I have made the transfer',
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            )
                          : CommonWidgets.commonElevatedButton(
                              onPressed: () {
                                selectedIndex.value = 0;
                                Get.offAllNamed(Routes.NAV_BAR);
                              },
                              child: Text(
                                'CLOSE',
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                      SizedBox(height: 14.px),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        /*
        addMoneyController.clear();
        isWaiting.value = true;
        secondsRemaining.value = (5 * 60);*/
      ).whenComplete(() {
        increment();
      });
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'Error',
          'All field required Or something wnt wrong');
    }
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
        increment();
      } else {
        isWaiting.value = false;
        timer.cancel();
        increment();
      }
    });
  }

  String get formattedTimeMethod {
    final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  clickOnCopyIcon() async {
    await Clipboard.setData(
      ClipboardData(
        text: dataNumber.value,
      ),
    );
    Get.snackbar(
        margin: EdgeInsets.all(20.px), 'Massage', 'Copied to your clipboard !');
  }

  clickOnCrossIcon() {
    Get.back();
  }
}
