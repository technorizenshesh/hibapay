import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_received_gifts_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GiftUserCardsController extends GetxController {
  final count = 0.obs;
  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    await onInitWork();
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

  clickOnCard({required int index}) async {
    inAsyncCall.value = true;
    await sendGiftAsMoneyClaimApi(
        giftId: getReceivedGiftsResult[index].giftsId ?? '');
    await getReceivedGiftsApi();
    inAsyncCall.value = false;
  }

  onInitWork() async {
    if (authTokenHiba.value.isNotEmpty) {
      if (getReceivedGiftsResult.isEmpty) {
        inAsyncCall.value = true;
      }
      await getReceivedGiftsApi();
      inAsyncCall.value = false;
    }
  }

  getReceivedGiftsApi() async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    GetReceivedGiftsModel? getReceivedGiftsModel =
        await ApiMethods.getReceivedGifts(bodyParams: bodyParams);
    if (getReceivedGiftsModel != null && getReceivedGiftsModel.result != null) {
      getReceivedGiftsResult.clear();
      getReceivedGiftsResult =
          getReceivedGiftsModel.result!.toList().reversed.toList();
      int i = 0;
      getReceivedGiftsResult.forEach((element) {
        Logger().i(
            "${element.giftsAmount}    ---    ${getReceivedGiftsModel.result![i].giftsAmount}");
        i++;
      });
      getReceivedGiftsResult.sort((a, b) {
        String statusA = a.giftsClaimStatus ?? ' ';
        String statusB = b.giftsClaimStatus ?? ' ';
        if (statusA == 'PENDING' && statusB != 'PENDING') {
          return -1; // a should come before b
        } else if (statusA != 'PENDING' && statusB == 'PENDING') {
          return 1; // b should come before a
        } else {
          return 0; // leave them unchanged
        }
      });
      increment();
    }
  }

  sendGiftAsMoneyClaimApi({required String giftId}) async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.giftId: giftId,
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    UserModel? userModel =
        await ApiMethods.sendGiftAsMoneyClaim(bodyParams: bodyParams);
    if (userModel != null &&
        userModel.status != null &&
        userModel.status!.isNotEmpty &&
        userModel.status != '0') {
      await getReceivedGiftsApi();
    } else {
      if (userModel != null &&
          userModel.message != null &&
          userModel.message!.isNotEmpty) {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', userModel.message!);
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', 'Something went wrong');
      }
    }
  }
}
