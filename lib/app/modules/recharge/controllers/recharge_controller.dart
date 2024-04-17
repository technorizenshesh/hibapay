import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/bill_pay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/ufitpay_get_vendors_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RechargeController extends GetxController {
  final count = 0.obs;

  Map<String, String?> parameters = Get.parameters;
  String title = '';
  final serviceId = ''.obs;

  TextEditingController amountController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  FocusNode focusMobileNumber = FocusNode();
  FocusNode focusAmount = FocusNode();
  FocusNode focusServiceProvider = FocusNode();
  final isMobileNumber = false.obs;
  final isAmount = false.obs;
  final isServiceProvider = false.obs;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;

  List<UFitPayGetVendorsResultData> uFitPayGetVendorsResultData = [];

  final vendorName = ''.obs;
  final vendorId = ''.obs;
  final packageName = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    title = parameters[StringConstants.title] ?? '';
    serviceId.value = parameters[ApiKeyConstants.serviceId] ?? '';
    super.onInit();
    startListener();
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
  }

  void startListener() {
    focusMobileNumber.addListener(onFocusChange);
    focusAmount.addListener(onFocusChange);
    focusServiceProvider.addListener(onFocusChange);
  }

  void onFocusChange() {
    isMobileNumber.value = focusMobileNumber.hasFocus;
    isAmount.value = focusAmount.hasFocus;
    isServiceProvider.value = focusServiceProvider.hasFocus;
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
    if (mobileNumberController.text.trim().isNotEmpty &&
        serviceProviderController.text.trim().isNotEmpty &&
        amountController.text.trim().isNotEmpty) {
      if (int.parse(amountController.text) >= 100) {
        inAsyncCall.value = true;
        Map<String, dynamic> bodyParams = {
          ApiKeyConstants.authTokenHiba: authTokenHiba.value,
          ApiKeyConstants.serviceId: serviceId.value,
          ApiKeyConstants.vendorId: vendorId.value,
          ApiKeyConstants.accountNumber: mobileNumberController.text,
          ApiKeyConstants.amount: amountController.text,
        };
        BillPayModel? billPayModel =
            await ApiMethods.uFitPayBillPay(bodyParams: bodyParams);
        if (billPayModel != null &&
            billPayModel.result != null &&
            billPayModel.result!.data != null) {
          Get.back();
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              '${billPayModel.result!.resource ?? ''} ${billPayModel.result!.status ?? ''}',
              billPayModel.result!.data!.paymentStatus ?? '');
          increment();
        } else {
          if (billPayModel != null && billPayModel.result != null) {
            Get.snackbar(
                margin: EdgeInsets.all(20.px),
                'Fail',
                billPayModel.result!.message ?? '');
          }
        }
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', 'Enter amount above 100');
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnServiceProvider() {
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
                StringConstants.selectProvider,
                style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(Get.context!).primaryColor,
                    ),
              ),
              SizedBox(height: 14.px),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() {
                    count.value;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.px),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Theme.of(Get.context!)
                              .colorScheme
                              .surface, // Set the inactive color here
                        ),
                        child: RadioListTile(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.px),
                            borderSide: BorderSide(
                              color: Theme.of(Get.context!).colorScheme.surface,
                              width: .4.px,
                            ),
                          ),
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) async {
                            vendorName.value =
                                uFitPayGetVendorsResultData[index].vendorName ??
                                    '';
                            vendorId.value =
                                uFitPayGetVendorsResultData[index].vendorId ??
                                    '';
                            /*packages =
                                uFitPayGetVendorsResultData[index].packages ?? [];*/
                            serviceProviderController.text = vendorName.value;
                            increment();
                            print('vendorName.value:::${vendorName.value}');
                            Get.back();
                          },
                          title: Text(
                            uFitPayGetVendorsResultData[index].vendorName ?? '',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: vendorName.value,
                          groupValue:
                              uFitPayGetVendorsResultData[index].vendorName ??
                                  '',
                        ),
                      ),
                    );
                  });
                },
                itemCount: uFitPayGetVendorsResultData.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    ).whenComplete(() async {
      // await uFitPayGetPackagesApi(vendorId: vendorId.value);
    });
  }

  onInitWorking() async {
    await uFitPayGetVendorsApi();
  }

  uFitPayGetVendorsApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.serviceId: serviceId.value,
    };
    UFitPayGetVendorsModel? uFitPayGetVendorsModel =
        await ApiMethods.uFitPayGetVendors(bodyParams: bodyParams);
    if (uFitPayGetVendorsModel != null &&
        uFitPayGetVendorsModel.result != null &&
        uFitPayGetVendorsModel.result!.data != null &&
        uFitPayGetVendorsModel.result!.data!.isNotEmpty) {
      uFitPayGetVendorsResultData = uFitPayGetVendorsModel.result!.data!;
      if (uFitPayGetVendorsResultData.isNotEmpty &&
          uFitPayGetVendorsResultData.first.vendorId != null &&
          uFitPayGetVendorsResultData.first.vendorId!.isNotEmpty) {
        /*await uFitPayGetPackagesApi(
            vendorId: uFitPayGetVendorsResultData.first.vendorId ?? '');*/
        serviceProviderController.text =
            uFitPayGetVendorsResultData.first.vendorName ?? '';
        vendorName.value = uFitPayGetVendorsResultData.first.vendorName ?? '';
        vendorId.value = uFitPayGetVendorsResultData.first.vendorId ?? '';
      }
      increment();
    }
  }
}
