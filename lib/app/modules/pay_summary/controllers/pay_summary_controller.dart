import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/bill_pay_model.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaySummaryController extends GetxController {
  final count = 0.obs;
  Map<String, dynamic> bodyParams = Get.arguments;
  final inAsyncCall = false.obs;
  @override
  void onInit() {
    super.onInit();
    print('bodyParams::::::::::::::::::${bodyParams}');
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
        billPayModel.result != null &&
        billPayModel.result!.data != null) {
      Get.back();
      Get.back();
      Get.toNamed(Routes.PAY_SUMMARY_SUCCESS, arguments: bodyParams);
      Get.snackbar(
          margin: EdgeInsets.all(20.px),
          '${billPayModel.result!.resource ?? ''} ${billPayModel.result!.status ?? ''}',
          billPayModel.result!.data!.paymentStatus ?? '');
      increment();
    } else {
      if (billPayModel != null && billPayModel.message != null) {
        Get.snackbar(
            margin: EdgeInsets.all(20.px),
            'Failed',
            billPayModel.message ?? '');
      } else {
        Get.snackbar(margin: EdgeInsets.all(20.px), 'Error', 'Server down');
      }
    }
    inAsyncCall.value = false;
  }
}
