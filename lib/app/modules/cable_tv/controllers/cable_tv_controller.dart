import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_packages_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_price_list_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_price_model.dart';
import 'package:HibaPay/app/data/apis/api_models/ufitpay_get_vendors_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CableTvController extends GetxController {
  final count = 0.obs;

  Map<String, String?> parameters = Get.parameters;
  String title = '';
  final serviceId = ''.obs;

  TextEditingController amountController = TextEditingController();
  TextEditingController serviceProviderController = TextEditingController();
  TextEditingController packagesController = TextEditingController();
  TextEditingController decoderNumberController = TextEditingController();

  FocusNode focusDecoderNumber = FocusNode();
  FocusNode focusAmount = FocusNode();
  FocusNode focusServiceProvider = FocusNode();
  FocusNode focusPackages = FocusNode();
  final isDecoderNumber = false.obs;
  final isAmount = false.obs;
  final isServiceProvider = false.obs;
  final isPackages = false.obs;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;

  List<UFitPayGetVendorsResultData> uFitPayGetVendorsResultData = [];

  // List<GetPriceListResultData> getPriceListResultData = [];
  List<GetPackagesResultData> getPackagesResultData = [];
  List<Packages> packages = [];

  final vendorName = ''.obs;
  final vendorId = ''.obs;
  final packageId = ''.obs;
  final packageName = ''.obs;
  final packageAmount = ''.obs;
  final commission = ''.obs;

  final commissionType = ''.obs;
  final commissionValue = ''.obs;

  Map<String, dynamic> bodyParams = {};
  Map<String, String> bodyParams1 = {};

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    title = parameters[StringConstants.title] ?? '';
    serviceId.value = parameters[ApiKeyConstants.serviceId] ?? '';
    commission.value = parameters[ApiKeyConstants.commission] ?? '';
    commission.value = parameters[ApiKeyConstants.commission] ?? '';
    commissionType.value = parameters[ApiKeyConstants.commissionType] ?? '';
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
    focusPackages.addListener(onFocusChange);
  }

  void onFocusChange() {
    isDecoderNumber.value = focusDecoderNumber.hasFocus;
    isAmount.value = focusAmount.hasFocus;
    isServiceProvider.value = focusServiceProvider.hasFocus;
    isPackages.value = focusPackages.hasFocus;
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
    if (decoderNumberController.text.trim().isNotEmpty &&
        serviceProviderController.text.trim().isNotEmpty &&
        packagesController.text.trim().isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.accountNumber: decoderNumberController.text,
        ApiKeyConstants.serviceType: ApiKeyConstants.buyCableTv,
        ApiKeyConstants.serviceId: serviceId.value,
        ApiKeyConstants.vendorId: vendorId.value,
        ApiKeyConstants.packageId: packageId.value,
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      inAsyncCall.value = true;
      GetPriceModel? getPriceModel =
          await ApiMethods.getPrice(bodyParams: bodyParams);
      if (getPriceModel != null &&
          getPriceModel.result != null &&
          getPriceModel.result!.data != null) {
        if (getPriceModel.result!.data!.price != null &&
            getPriceModel.result!.data!.fee != null) {
          if (commissionType.value.isNotEmpty) {
            commissionValue.value =
                ((double.parse(getPriceModel.result!.data!.price.toString()) *
                            double.parse(commission.value.toString())) /
                        100)
                    .toString();
            increment();
          }
          bodyParams.clear();
          bodyParams = {
            ApiKeyConstants.accountNumber: decoderNumberController.text,
            ApiKeyConstants.amount:
                getPriceModel.result!.data!.price.toString(),

            ApiKeyConstants.uFitPayFee:
                getPriceModel.result!.data!.fee.toString(),
            // ApiKeyConstants.amount: (double.parse(
            //             getPriceModel.result!.data!.price.toString()) +
            //         double.parse(getPriceModel.result!.data!.fee.toString()) +
            //         double.parse(commission.value))
            //     .toString(),
            // StringConstants.fee: getPriceModel.result!.data!.fee != null &&
            //         getPriceModel.result!.data!.fee!.isNotEmpty &&
            //         getPriceModel.result!.data!.fee != '0'
            //     ? (double.parse(getPriceModel.result!.data!.fee.toString()) +
            //             double.parse(commission.value))
            //         .toString()
            //     : double.parse(commission.value).toString(),
            // StringConstants.total: (double.parse(
            //             getPriceModel.result!.data!.price.toString()) +
            //         double.parse(getPriceModel.result!.data!.fee.toString()) +
            //         double.parse(commission.value))
            //     .toString(),
            ApiKeyConstants.serviceType: ApiKeyConstants.buyCableTv,
            ApiKeyConstants.serviceId: serviceId.value,
            ApiKeyConstants.vendorId: vendorId.value,
            ApiKeyConstants.packageId: packageId.value,
            ApiKeyConstants.authTokenHiba: authTokenHiba.value,
          };
          bodyParams1.clear();
          bodyParams1 = {
            StringConstants.decoderNumber: decoderNumberController.text,
            StringConstants.amount:
                getPriceModel.result!.data!.price.toString(),
            StringConstants.serviceType:
                convertToTitleCase(ApiKeyConstants.buyCableTv),
            StringConstants.description:
                "${vendorName.toString()} - ${packageName.toString()}",
            StringConstants.fee: (getPriceModel.result!.data!.fee != null &&
                    getPriceModel.result!.data!.fee!.isNotEmpty &&
                    getPriceModel.result!.data!.fee != '0')
                ? (double.parse(getPriceModel.result!.data!.fee.toString()) +
                        double.parse(commissionType.value != 'PERCENTAGE'
                            ? commission.value
                            : commissionValue.value))
                    .toString()
                : commissionType.value != 'PERCENTAGE'
                    ? double.parse(commission.value).toString()
                    : double.parse(commissionValue.value).toString(),
            StringConstants.total: (double.parse(
                        getPriceModel.result!.data!.price.toString()) +
                    double.parse(getPriceModel.result!.data!.fee.toString()) +
                    double.parse(commissionType.value != 'PERCENTAGE'
                        ? commission.value
                        : commissionValue.value))
                .toString(),
          };
          Get.toNamed(Routes.PAY_SUMMARY,
              parameters: bodyParams1, arguments: bodyParams);
        } else {
          Get.snackbar(
              margin: EdgeInsets.all(20.px), 'Error', 'Something went wrong');
        }
      } else {
        if (getPriceModel != null &&
            getPriceModel.result != null &&
            getPriceModel.result!.message != null &&
            getPriceModel.result!.message!.isNotEmpty) {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Error',
              getPriceModel.result!.message! ?? '');
        } else {
          if (getPriceModel != null &&
              getPriceModel.message != null &&
              getPriceModel.message!.isNotEmpty) {
            Get.snackbar(
                margin: EdgeInsets.all(20.px),
                'Error',
                getPriceModel.message ?? '');
          }
          Get.snackbar(
              margin: EdgeInsets.all(20.px), 'Error', 'Something went wrong');
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  String convertToTitleCase(String input) {
    List<String> words = input.split('_');
    String titleCaseString = words.map((word) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
    return titleCaseString;
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
      await uFitPayGetPackagesApi(vendorId: vendorId.value);
    });
  }

  clickOnPackages() {
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
                            packageName.value =
                                getPackagesResultData[index].packageName ?? '';
                            packagesController.text = packageName.value;
                            packageId.value =
                                getPackagesResultData[index].packageId ?? '';
                            increment();
                            print('packageName.value:::${packageName.value}');
                            Get.back();
                          },
                          title: Text(
                            getPackagesResultData[index].packageName ?? '',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: packageName.value,
                          groupValue:
                              getPackagesResultData[index].packageName ?? '',
                        ),
                      ),
                    );
                  });
                },
                itemCount: getPackagesResultData.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  clickOnPackagesAmount() {
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
                StringConstants.selectPackagesAmount,
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
                            packageAmount.value = packages[index].price ?? '';
                            amountController.text = packageAmount.value;
                            increment();
                            print('packageName.value:::${packageAmount.value}');
                            Get.back();
                          },
                          title: Text(
                            packages[index].price ?? '',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: packageAmount.value,
                          groupValue: packages[index].price ?? '',
                        ),
                      ),
                    );
                  });
                },
                itemCount: packages.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  onInitWorking() async {
    await uFitPayGetVendorsApi();
    // await uFitPayGetPriceListApi();
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
        serviceProviderController.text =
            uFitPayGetVendorsResultData.first.vendorName ?? '';
        vendorName.value = uFitPayGetVendorsResultData.first.vendorName ?? '';
        vendorId.value = uFitPayGetVendorsResultData.first.vendorId ?? '';
        await uFitPayGetPackagesApi(
            vendorId: uFitPayGetVendorsResultData.first.vendorId ?? '');
      }
      increment();
    }
  }

/*  uFitPayGetPriceListApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.serviceId: serviceId.value,
    };
    GetPriceListModel? getPriceListModel =
        await ApiMethods.uFitPayGetPriceList(bodyParams: bodyParams);
    if (getPriceListModel != null &&
        getPriceListModel.result != null &&
        getPriceListModel.result!.data != null &&
        getPriceListModel.result!.data!.isNotEmpty) {
      getPriceListResultData = getPriceListModel.result!.data!;
      if (getPriceListResultData
              .isNotEmpty */ /*&&
          getPriceListResultData.first.vendorId != null &&
          getPriceListResultData.first.vendorId!.isNotEmpty*/ /*
          ) {
        packages = getPriceListResultData.first.packages ?? [];
        vendorName.value = getPriceListResultData.first.vendorName ?? '';
        vendorId.value = getPriceListResultData.first.vendorId ?? '';
        */ /* await uFitPayGetPackagesApi(
            vendorId: getPriceListResultData.first.vendorId ?? '');*/ /*
      }
      increment();
    }
  }*/

  uFitPayGetPackagesApi({required String vendorId}) async {
    getPackagesResultData.clear();
    packageName.value = '';
    packagesController.clear();
    inAsyncCall.value = true;
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.vendorId: vendorId,
    };
    GetPackagesModel? getPackagesModel =
        await ApiMethods.uFitPayGetPackages(bodyParams: bodyParams);
    if (getPackagesModel != null &&
        getPackagesModel.result != null &&
        getPackagesModel.result!.data != null &&
        getPackagesModel.result!.data!.isNotEmpty) {
      getPackagesResultData = getPackagesModel.result!.data!;
      increment();
    }
    inAsyncCall.value = false;
  }
}
