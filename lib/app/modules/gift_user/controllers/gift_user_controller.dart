import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GiftUserController extends GetxController {
  Map<String, String?> parameters = Get.parameters;
  TextEditingController giftingAmountController = TextEditingController();
  TextEditingController receiverIdController = TextEditingController();
  TextEditingController desController = TextEditingController();
  FocusNode focusGiftingAmount = FocusNode();
  FocusNode focusReceiverId = FocusNode();
  FocusNode focusDes = FocusNode();
  final count = 0.obs;
  final title = ''.obs;
  final serviceId = ''.obs;
  final giftingAmountControllerValue = ''.obs;
  final isGiftingAmount = false.obs;
  final isReceiverId = false.obs;
  final isDes = false.obs;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    title.value = parameters[StringConstants.title] ?? '';
    serviceId.value = parameters[ApiKeyConstants.serviceId] ?? '';
    super.onInit();
    startListener();
  }

  void startListener() {
    focusGiftingAmount.addListener(onFocusChange);
    focusReceiverId.addListener(onFocusChange);
    focusDes.addListener(onFocusChange);
  }

  void onFocusChange() {
    isGiftingAmount.value = focusGiftingAmount.hasFocus;
    isReceiverId.value = focusReceiverId.hasFocus;
    isDes.value = focusDes.hasFocus;
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

  clickOnSendGiftButton() async {
    if (receiverIdController.text.trim().isNotEmpty &&
        giftingAmountController.text.trim().isNotEmpty) {
      if (double.parse(giftingAmountController.text.toString()) > 50.0) {
        if (double.parse(giftingAmountController.text.toString()) < 30000.0) {
          inAsyncCall.value = true;
          Map<String, dynamic> bodyParams = {
            ApiKeyConstants.authTokenHiba: authTokenHiba.value,
            ApiKeyConstants.amount: giftingAmountControllerValue.value,
            ApiKeyConstants.receiverId: receiverIdController.text,
            ApiKeyConstants.giftsDescription:
                '${result?.firstName ?? ''} ${result?.lastName ?? ''}',
            //desController.text,
          };
          UserModel? userModel =
              await ApiMethods.sendGift(bodyParams: bodyParams);
          if (userModel != null) {
            if (userModel.message != null && userModel.message!.isNotEmpty) {
              if (userModel.message == 'Success') {
                Get.back();
                showCupertinoDialog(
                  context: Get.context!,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.px),
                      ),
                      content: Container(
                        padding: EdgeInsets.all(24.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.px),
                          gradient: LinearGradient(
                            end: Alignment.topRight,
                            begin: Alignment.bottomLeft,
                            colors: [
                              Theme.of(Get.context!).colorScheme.secondary,
                              Theme.of(Get.context!).colorScheme.onSecondary,
                            ],
                          ),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Image.asset('assets/icons_png/ic_gift_pop_up.png',
                              width: 100.px, height: 85.px),
                          SizedBox(height: 24.px),
                          Text(
                            'GIFT SENT!',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 28.px,
                                  fontStyle: FontStyle.italic,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                          SizedBox(height: 14.px),
                          Text(
                            'YOU SUCCESSFULLY SEND ${receiverIdController.text} A GIFT.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                          SizedBox(height: 34.px),
                          InkWell(
                            onTap: () => clickOnBack(),
                            borderRadius: BorderRadius.circular(14.px),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.px, vertical: 14.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.px),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonMethods.textViewLinearGradient(
                                    text: StringConstants.back,
                                    value: true,
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.px),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  },
                );
              } else {
                Get.snackbar(
                    margin: EdgeInsets.all(20.px),
                    'Error',
                    userModel.message ?? '');
              }
            }
          }
        } else {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Error',
              'Maximum gift input is 30,000');
        }
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', 'Minimum gift input is 50');
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnBack() {
    Get.back();
  }
}
