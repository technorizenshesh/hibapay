import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/fund_virtual_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class DepositController extends GetxController {
  final count = 0.obs;

  final isAmount = false.obs;
  FocusNode focusAmount = FocusNode();
  TextEditingController amountController = TextEditingController();

  final inAsyncCall = false.obs;
  final authTokenHiba = ''.obs;
  final virtualCardId = ''.obs;

  FundVirtualCardResult? result;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    virtualCardId.value = sp.getString(ApiKeyConstants.virtualCardId) ?? '';
    super.onInit();
    startListener();
  }

  void startListener() {
    focusAmount.addListener(onFocusChange);
  }

  void onFocusChange() {
    isAmount.value = focusAmount.hasFocus;
  }

  clickOnTopUpWalletButton() async {
    if (amountController.text.isNotEmpty) {
      inAsyncCall.value = true;
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
        ApiKeyConstants.virtualCardId: virtualCardId.value,
        ApiKeyConstants.virtualCardAmount: amountController.text,
        ApiKeyConstants.virtualCardFundingCurrency: 'NGN',
      };
      FundVirtualCardModel? fundVirtualCardModel =
          await ApiMethods.fundVirtualCard(bodyParams: bodyParams);
      if (fundVirtualCardModel != null && fundVirtualCardModel.result != null) {
        result = fundVirtualCardModel.result!;
        Get.back();
        increment();
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar('Something went wrong', 'Amount field required');
    }
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

  clickOnTopUpWalletButton1() {
    showModalBottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      context: Get.context!,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                StringConstants.selectYourBank,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 14.px),
              ListTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.px),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: .4.px,
                  ),
                ),
                trailing:
                    CommonMethods.appIcons(assetName: IconConstants.icCheck),
                subtitle: Text(
                  '**** **** **** 1121',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                title: Text(
                  'Bank of America',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).primaryColor),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24.px),
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    height: 48.px,
                    width: 48.px,
                  ),
                ),
              ),
              SizedBox(height: 14.px),
              ListTile(
                trailing: CommonMethods.appIcons(
                    assetName: IconConstants.icRightArrow),
                title: Text(
                  StringConstants.addNewBank,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).primaryColor),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24.px),
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    height: 18.px,
                    width: 18.px,
                  ),
                ),
              ),
              SizedBox(height: 14.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => clickOnConfirmButton(),
                child: Text(
                  StringConstants.confirm,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      ),
    );
  }

  clickOnConfirmButton() {
    Get.back();
  }
}
