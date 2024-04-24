import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GiftUserController extends GetxController {
  final count = 0.obs;

  Map<String, String?> parameters = Get.parameters;
  String title = '';
  final serviceId = ''.obs;

  TextEditingController giftingAmountController = TextEditingController();
  TextEditingController receiverIdController = TextEditingController();

  FocusNode focusGiftingAmount = FocusNode();
  FocusNode focusReceiverId = FocusNode();
  final isGiftingAmount = false.obs;
  final isReceiverId = false.obs;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    title = parameters[StringConstants.title] ?? '';
    serviceId.value = parameters[ApiKeyConstants.serviceId] ?? '';
    super.onInit();
    startListener();
  }

  void startListener() {
    focusGiftingAmount.addListener(onFocusChange);
    focusReceiverId.addListener(onFocusChange);
  }

  void onFocusChange() {
    isGiftingAmount.value = focusGiftingAmount.hasFocus;
    isReceiverId.value = focusReceiverId.hasFocus;
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

  clickOnContinueButton() async {
    if (receiverIdController.text.trim().isNotEmpty &&
        giftingAmountController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
        ApiKeyConstants.amount: giftingAmountController.text,
        ApiKeyConstants.receiverId: receiverIdController.text,
      };
      UserModel? userModel =
          await ApiMethods.giftSendGiftAsMoney(bodyParams: bodyParams);
      if (userModel != null) {
        if (userModel.message != null && userModel.message!.isNotEmpty) {
          if (userModel.message == 'Success') {
            Get.back();
            Get.snackbar(
                margin: EdgeInsets.all(20.px), 'Pay', userModel.message ?? '');
          } else {
            Get.snackbar(
                margin: EdgeInsets.all(20.px),
                'Error',
                userModel.message ?? '');
          }
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }
}
