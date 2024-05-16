import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/cupertino.dart';
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
                Get.snackbar(
                    margin: EdgeInsets.all(20.px),
                    'Send',
                    userModel.message ?? '');
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
}
