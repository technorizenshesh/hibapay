import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/bill_pay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_live_transaction_details_model.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaySummaryController extends GetxController {
  final count = 0.obs;
  Map<String, dynamic> bodyParams = Get.arguments;
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    print('bodyParams::::::::::::::::::${bodyParams}');
    print('parameters::::::::::::::::::${parameters}');
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

  clickOnPayButton() async {
    inAsyncCall.value = true;
    BillPayModel? billPayModel =
        await ApiMethods.uFitPayBillPay(bodyParams: bodyParams);
    if (billPayModel != null &&
        billPayModel.status != null &&
        billPayModel.status!.isNotEmpty &&
        billPayModel.status != '0' &&
        billPayModel.result != null &&
        billPayModel.result!.data != null) {
      Get.back();
      Get.back();
      if (billPayModel.result!.data != null &&
          billPayModel.result!.data!.reference != null &&
          billPayModel.result!.data!.reference!.isNotEmpty) {
        getLiveTransactionDetailsApi(
            reference: billPayModel.result!.data!.reference ?? '');
      }
      Get.toNamed(Routes.PAY_SUMMARY_SUCCESS, arguments: parameters);
      /*Get.snackbar(
          margin: EdgeInsets.all(20.px),
          '${billPayModel.result!.resource ?? ''} ${billPayModel.result!.status ?? ''}',
          billPayModel.result!.data!.paymentStatus ?? '');*/
      increment();
    } else {
      if (billPayModel != null &&
          billPayModel.result != null &&
          billPayModel.result!.message != null &&
          billPayModel.result!.message!.isNotEmpty) {
        Get.snackbar(
            margin: EdgeInsets.all(20.px),
            'Failed',
            billPayModel.result!.message ?? '');
      } else {
        if (billPayModel != null &&
            billPayModel.message != null &&
            billPayModel.message!.isNotEmpty) {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Failed',
              billPayModel.message ?? '');
        } else {
          Get.snackbar(margin: EdgeInsets.all(20.px), 'Error', 'Server down');
        }
      }
    }
    inAsyncCall.value = false;
  }

  getLiveTransactionDetailsApi({required String reference}) async {
    inAsyncCall.value = true;
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.reference: reference,
    };
    GetLiveTransactionDetailsModel? getLiveTransactionDetailsModel =
        await ApiMethods.getLiveTransactionDetails(bodyParams: bodyParams);
    if (getLiveTransactionDetailsModel != null &&
        getLiveTransactionDetailsModel.result != null &&
        getLiveTransactionDetailsModel.result!.data != null) {
      increment();
    }
    inAsyncCall.value = false;
  }
}
