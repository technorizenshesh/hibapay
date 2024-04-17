import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_transactions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<GetServicesResult> getServicesResult = [];
List<GetBannersResult> getBannersResult = [];
List<GetCardTransactionsResultData> getCardTransactionsResultData = [];

class HomeController extends GetxController {
  final count = 0.obs;
  final cardIndex = 0.obs;
  Result? result;
  GetCardTransactionsResult? getCardTransactionsResult;
  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;
  final virtualCardId = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    virtualCardId.value = sp.getString(ApiKeyConstants.virtualCardId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
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

  onInitWorking() async {
    await getProfileApi();
    await getBannersApi();
    await getServicesApi();
    await getCardTransactionsApi();
  }

  getProfileApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    UserModel? userModel = await ApiMethods.getProfile(bodyParams: bodyParams);
    if (userModel != null && userModel.result != null) {
      result = userModel.result!;
      increment();
    }
  }

  getBannersApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.type: ApiKeyConstants.home,
    };
    GetBannersModel? getBannersModel =
        await ApiMethods.getBanners(bodyParams: bodyParams);
    if (getBannersModel != null &&
        getBannersModel.result != null &&
        getBannersModel.result!.isNotEmpty) {
      getBannersResult = getBannersModel.result!;
      increment();
    }
  }

  getServicesApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    GetServicesModel? getServicesModel =
        await ApiMethods.getServices(bodyParams: bodyParams);
    if (getServicesModel != null &&
        getServicesModel.result != null &&
        getServicesModel.result!.isNotEmpty) {
      getServicesResult = getServicesModel.result!;
      increment();
    }
  }

  getCardTransactionsApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.virtualCardId: virtualCardId.value,
    };
    GetCardTransactionsModel? getCardTransactionsModel =
        await ApiMethods.getCardTransactions(bodyParams: bodyParams);
    if (getCardTransactionsModel != null &&
        getCardTransactionsModel.result != null) {
      getCardTransactionsResult = getCardTransactionsModel.result!;
      if (getCardTransactionsResult != null &&
          getCardTransactionsResult!.data != null &&
          getCardTransactionsResult!.data!.isNotEmpty) {
        getCardTransactionsResultData = getCardTransactionsResult!.data!;
      }
      increment();
    }
  }

  clickOnTransfers() {
    Get.toNamed(Routes.TRANSFER);
  }

  clickOnWithdraw() {
    Get.toNamed(Routes.WITHDRAW);
  }

  clickOnMore() {
    Get.toNamed(Routes.MORE);
  }

  clickOnAllTransactions() {
    Get.toNamed(Routes.ALL_TRANSACTIONS);
  }

  clickOnNotificationIcon() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  clickOnWallet() {
    Get.toNamed(Routes.WALLET);
  }

  clickOnDeposit() {
    Get.toNamed(Routes.DEPOSIT);
  }

  clickOnSpinnerIcon() {
    //Get.toNamed(Routes.SPINNER);
    /*Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => const SpinnerViewSTF(),
      ),
    );*/
    Get.snackbar(
        margin: EdgeInsets.all(20.px),
        'Spin wheel',
        'Spin Not available at the moment, this feature will be available soon');
  }

  clickOnCard({required int index}) {
    switch (getServicesResult[index].serviceId.toString()) {
      case '0001':
        if (getServicesResult[index].type.toString() ==
            ApiKeyConstants.uFitPay) {
          Get.toNamed(Routes.RECHARGE, parameters: {
            StringConstants.title:
                getServicesResult[index].serviceNameCustom ?? '',
            ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
          });
        } else {
          if (getServicesResult[index].serviceId.toString() == '0001') {
            Get.toNamed(Routes.GIFT_USER, parameters: {
              StringConstants.title:
                  getServicesResult[index].serviceNameCustom ?? '',
              ApiKeyConstants.serviceId:
                  getServicesResult[index].serviceId ?? '',
            });
          } else {
            Get.toNamed(Routes.WITHDRAW, parameters: {
              StringConstants.title:
                  getServicesResult[index].serviceNameCustom ?? '',
              ApiKeyConstants.serviceId:
                  getServicesResult[index].serviceId ?? '',
            });
          }
        }
        break;
      case '0003':
        Get.toNamed(Routes.ELECTRICITY, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        break;
      case '0002' || '0004':
        Get.toNamed(Routes.DATA, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        break;
      case '0005':
        Get.toNamed(Routes.CABLE_TV, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        break;
      case '0036':
        Get.toNamed(Routes.BETTING, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        break;
      default:
        CommonWidgets.snackBarView(title: 'Coming soon');
    }
  }
}
