import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/string_constants.dart';

class BilPaymentController extends GetxController {
  final count = 0.obs;

  Map<String, String?> parameters = Get.parameters;
  String title = '';

  TextEditingController meterNumberController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController fromWhichAccountDoYouWantToPayController =
      TextEditingController();

  final isChecked = true.obs;
  List listOfServices = ['pay', 'ment', 'add', 'card'];
  final selectedValue = ''.obs;

  List listOfAccount = ['Google', 'Gmail', 'Rum', 'Way', 'Card'];
  final selectedValueAccount = ''.obs;

  @override
  void onInit() {
    title = parameters['title'] ?? '';
    super.onInit();
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

  clickOnContinueButton() {
    Get.toNamed(Routes.BIL_PAYMENT_SUBMIT);
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
            shrinkWrap: true,
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
                            selectedValue.value = listOfServices[index];
                            serviceProviderController.text =
                                selectedValue.value;
                            increment();
                            print(
                                'selectedValue.value:::${selectedValue.value}');
                            Get.back();
                          },
                          title: Text(
                            listOfServices[index],
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: selectedValue.value,
                          groupValue: listOfServices[index],
                        ),
                      ),
                    );
                  });
                },
                itemCount: listOfServices.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  clickOnAccountDoYouPay() {
    Get.bottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                StringConstants.selectAccount,
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
                            selectedValueAccount.value = listOfAccount[index];
                            fromWhichAccountDoYouWantToPayController.text =
                                selectedValueAccount.value;
                            increment();
                            print(
                                'selectedValueAccount.value:::${selectedValueAccount.value}');
                            Get.back();
                          },
                          title: Text(
                            listOfAccount[index],
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: selectedValueAccount.value,
                          groupValue: listOfAccount[index],
                        ),
                      ),
                    );
                  });
                },
                itemCount: listOfAccount.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }
}
