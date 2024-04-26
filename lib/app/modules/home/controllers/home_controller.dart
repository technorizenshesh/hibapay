import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_holder_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_card_transactions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/time_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final cardIndex = 0.obs;
  final inAsyncCall = false.obs;
  final isLock = false.obs;
  final authTokenHiba = ''.obs;
  final isLockPin = ''.obs;
  final virtualCardId = ''.obs;

  TextEditingController pin = TextEditingController();
  FocusNode focusDateOfBirth = FocusNode();
  final isDateOfBirth = false.obs;
  TextEditingController dateOfBirthController = TextEditingController();
  DateTime? dateTime;

  Map<String, dynamic> bodyParams = {};

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    virtualCardId.value = sp.getString(ApiKeyConstants.virtualCardId) ?? '';
    isLock.value = sp.getBool(StringConstants.isLock) ?? true;
    isLockPin.value = sp.getString(StringConstants.isLockPin) ?? '';
    super.onInit();
    startListener();
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
  }

  void startListener() {
    focusDateOfBirth.addListener(onFocusChange);
  }

  void onFocusChange() {
    isDateOfBirth.value = focusDateOfBirth.hasFocus;
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
    if (isLock.value) {
      await showBottomSheetLock();
    } else {
      if (selectedValue.value == 0) {
        selectedValue.value = 1;
        isValue.value = true;
      } else {
        isValue.value = false;
      }
      if (isValue.value) {
        await showBottomSheetLockEnter();
      }
    }
    await getCardHolderApi();
    await listVirtualCardsApi();
    await getBannersApi();
    await getServicesApi();
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

  getCardHolderApi() async {
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    GetCardHolderModel? getCardHolderModel =
        await ApiMethods.getCardHolder(bodyParams: bodyParams);
    if (getCardHolderModel != null && getCardHolderModel.result != null) {
      GetCardHolderResult? getCardHolderResult = getCardHolderModel.result;
      if (getCardHolderResult != null &&
          getCardHolderResult.cchCardHolderId != null &&
          getCardHolderResult.cchCardHolderId!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(
            ApiKeyConstants.cardHolderId, getCardHolderResult.cchCardHolderId!);
        increment();
      }
      increment();
    }
  }

  listVirtualCardsApi() async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
    };
    ListVirtualCardsModel? listVirtualCardsModel =
        await ApiMethods.listVirtualCards(bodyParams: bodyParams);
    listVirtualCardsResult.clear();
    if (listVirtualCardsModel != null &&
        listVirtualCardsModel.result != null &&
        listVirtualCardsModel.result!.isNotEmpty) {
      listVirtualCardsResult = listVirtualCardsModel.result!;
      print('listVirtualCardsResult::::::::::::::::${listVirtualCardsResult}');
      if (listVirtualCardsResult.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.virtualCardId,
            listVirtualCardsResult.first.vcardCardHolderId ?? '');
        await getCardTransactionsApi();
        increment();
      }
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
      GetCardTransactionsResult? getCardTransactionsResult =
          getCardTransactionsModel.result!;
      if (getCardTransactionsResult.data != null &&
          getCardTransactionsResult.data!.isNotEmpty) {
        getCardTransactionsResultData = getCardTransactionsResult.data!;
        increment();
      }
      increment();
    }
  }

  clickOnNotificationIcon() {
    Get.toNamed(Routes.NOTIFICATION);
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

  clickOnCard({required int index}) async {
    switch (getServicesResult[index].serviceId.toString()) {
      case '0001':
        if (getServicesResult[index].type.toString() ==
            ApiKeyConstants.uFitPay) {
          await Get.toNamed(Routes.RECHARGE, parameters: {
            StringConstants.title:
                getServicesResult[index].serviceNameCustom ?? '',
            ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
          });
          await getProfileApi();
        } else {
          if (getServicesResult[index].serviceId.toString() == '0001') {
            await Get.toNamed(Routes.GIFT_USER, parameters: {
              StringConstants.title:
                  getServicesResult[index].serviceNameCustom ?? '',
              ApiKeyConstants.serviceId:
                  getServicesResult[index].serviceId ?? '',
            });
            await getProfileApi();
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
        await Get.toNamed(Routes.ELECTRICITY, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        await getProfileApi();
        break;
      case '0002' || '0004':
        await Get.toNamed(Routes.DATA, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        await getProfileApi();
        break;
      case '0005':
        await Get.toNamed(Routes.CABLE_TV, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        await getProfileApi();
        break;
      case '0036':
        await Get.toNamed(Routes.BETTING, parameters: {
          StringConstants.title:
              getServicesResult[index].serviceNameCustom ?? '',
          ApiKeyConstants.serviceId: getServicesResult[index].serviceId ?? '',
        });
        await getProfileApi();
        break;
      default:
        CommonWidgets.snackBarView(title: 'Coming soon');
    }
  }

  showBottomSheetLock() {
    return Get.bottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      isDismissible: false,
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.actionRequired,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                          fontSize: 20.px,
                          color: Theme.of(Get.context!).primaryColor,
                        ),
                  ),
                  IconButton(
                    onPressed: () => clickOnCrossIcon(),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(Get.context!).primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.px),
              CommonMethods.appIcons(
                assetName: IconConstants.icPasswordInActive,
                height: 60.px,
                width: 60.px,
              ),
              SizedBox(height: 20.px),
              Text(
                "Hay ${result?.firstName ?? 'user'}!\nLet's help you add more security to your wallet with a account PIN",
                textAlign: TextAlign.center,
                style: Theme.of(Get.context!)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 16.px),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => clickOnsetAPinNowButton(),
                child: Text(
                  StringConstants.setAPinNow,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheetLockEnter() {
    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      builder: (BuildContext context) {
        // Listen to the back button event and call _onBackPressed method
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(16.px),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 60.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.actionRequired,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 20.px,
                              color: Theme.of(Get.context!).primaryColor,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 34.px),
                  CommonMethods.appIconsPng(
                    assetName: IconConstantsPng.icKey,
                    height: 100.px,
                    width: 100.px,
                  ),
                  SizedBox(height: 40.px),
                  Text(
                    'Welcome back ${result?.firstName ?? 'user'}!\nEnter your account PIN to continue',
                    textAlign: TextAlign.center,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 40.px),
                  CommonWidgets.commonOtpView(
                    controller: pin,
                    height: 60.px,
                    width: 60.px,
                    onCompleted: (value) {
                      print('value.toString()::::::::::::${value.toString()}');
                      print(
                          'pin.text.toString()::::::::::::${pin.text.toString()}');
                      if (value.toString() == isLockPin.value.toString()) {
                        Get.back();
                      } else {
                        Get.snackbar(
                            margin: EdgeInsets.all(20.px),
                            'Error',
                            'Wrong entered pin!');
                      }
                    },
                  ),
                  SizedBox(height: 40.px),
                  TextButton(
                    onPressed: () => clickOnForgotPin(),
                    child: Text(
                      'Forgot Pin?',
                      textAlign: TextAlign.center,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              fontSize: 16.px,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(height: 40.px),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  clickOnCrossIcon() {
    Get.back();
  }

  clickOnsetAPinNowButton() {
    Get.back();
    Get.toNamed(Routes.SET_PIN);
    if (selectedValue.value == 0) {
      selectedValue.value = 1;
      isValue.value = true;
    } else {
      isValue.value = false;
    }
  }

  clickOnForgotPin() {
    return showModalBottomSheet(
      context: Get.context!,
      // isScrollControlled: true,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      builder: (BuildContext context) {
        // Listen to the back button event and call _onBackPressed method
        return Padding(
          padding: EdgeInsets.all(16.px),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forgot Pin',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                          fontSize: 20.px,
                          color: Theme.of(Get.context!).primaryColor,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 20.px),
              Text(
                'Please select your dob and forgot your PIN',
                textAlign: TextAlign.center,
                style: Theme.of(Get.context!)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 16.px),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                readOnly: true,
                onTap: () => clickOnDob(),
                focusNode: focusDateOfBirth,
                title: StringConstants.dateOfBirth,
                controller: dateOfBirthController,
                isCard: isDateOfBirth.value,
                prefixIcon: CommonMethods.appIcons(
                  assetName: isDateOfBirth.value
                      ? IconConstants.icCalendarActive
                      : IconConstants.icCalendarInActive,
                ),
                hintText: StringConstants.pleaseEnterDateOfBirth,
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => clickOnSubmitButton(),
                child: Text(
                  StringConstants.submit,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        );
      },
    );
  }

  clickOnSubmitButton() async {
    print('');
    if (dateOfBirthController.text.trim().isNotEmpty) {
      if (dateOfBirthController.text == result?.dob) {
        dateOfBirthController.clear();
        await Get.toNamed(Routes.SET_PIN);
        Get.back();
      } else {
        Get.snackbar(margin: EdgeInsets.all(20.px), 'message', 'Not Matched');
      }
    } else {
      Get.snackbar(margin: EdgeInsets.all(20.px), 'message', 'DOB is required');
    }
  }

  clickOnDob() async {
    dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(1940),
      firstDate: DateTime(1940),
    );
    if (dateTime != null) {
      //02-01-1940
      dateOfBirthController.text = DateFormat('dd-MM-yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }
}
