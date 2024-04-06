import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/u_fit_pay_get_services_model.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CableTvController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String title = '';
  TextEditingController decoderNumberController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  FocusNode focusDecoderNumber = FocusNode();
  FocusNode focusAmount = FocusNode();
  FocusNode focusServiceProvider = FocusNode();
  final isDecoderNumber = false.obs;
  final isAmount = false.obs;
  final isServiceProvider = false.obs;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;
  List<UFitPayGetServicesResultData> uFitPayGetServicesResultData = [];
  final serviceName = ''.obs;
  final serviceId = ''.obs;

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
    focusDecoderNumber.addListener(onFocusChange);
    focusAmount.addListener(onFocusChange);
    focusServiceProvider.addListener(onFocusChange);
  }

  void onFocusChange() {
    isDecoderNumber.value = focusDecoderNumber.hasFocus;
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

  clickOnContinueButton() {}

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
                          onChanged: (value) {
                            serviceName.value =
                                uFitPayGetServicesResultData[index]
                                        .serviceName ??
                                    '';
                            serviceProviderController.text = serviceName.value;
                            increment();
                            print('serviceName.value:::${serviceName.value}');
                            Get.back();
                          },
                          title: Text(
                            uFitPayGetServicesResultData[index].serviceName ??
                                '',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: serviceName.value,
                          groupValue:
                              uFitPayGetServicesResultData[index].serviceName ??
                                  '',
                        ),
                      ),
                    );
                  });
                },
                itemCount: uFitPayGetServicesResultData.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  onInitWorking() async {
    await uFitPayGetServicesApi();
  }

  uFitPayGetServicesApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.serviceId: serviceId.value,
    };
    UFitPayGetServicesModel? uFitPayGetServicesModel =
        await ApiMethods.uFitPayGetServices(bodyParams: bodyParams);
    if (uFitPayGetServicesModel != null &&
        uFitPayGetServicesModel.result != null &&
        uFitPayGetServicesModel.result!.data != null &&
        uFitPayGetServicesModel.result!.data!.isNotEmpty) {
      uFitPayGetServicesResultData = uFitPayGetServicesModel.result!.data!;
      increment();
    }
  }
}
