import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/list_virtual_cards_model.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VirtualAccountAddController extends GetxController {
  final count = 0.obs;
  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;
  final selectedBank = 0.obs;

  FocusNode focusBankName = FocusNode();
  TextEditingController bankNameController = TextEditingController();
  final inAsyncCall = false.obs;
  final isBankName = false.obs;

  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isBvn = false.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bvnController = TextEditingController();

  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusBvn = FocusNode();

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    firstNameController.text = result?.firstName ?? 'NOT ADDED';
    lastNameController.text = result?.lastName ?? 'NOT ADDED';
    bvnController.text = result?.bvn ?? 'NOT ADDED';
    startListener();
  }

  void startListener() {
    focusBankName.addListener(onFocusChange);
    focusFirstName.addListener(onFocusChange);
    focusLastName.addListener(onFocusChange);
    focusBvn.addListener(onFocusChange);
  }

  void onFocusChange() {
    isBankName.value = focusBankName.hasFocus;
    isFirstName.value = focusFirstName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isBvn.value = focusBvn.hasFocus;
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
    if (bankNameController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.bank: bankNameController.text,
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      ListVirtualCardsModel? createCardHolderModel =
          await ApiMethods.createVirtualAccount(bodyParams: bodyParams);
      if (createCardHolderModel != null &&
          createCardHolderModel.status != null &&
          createCardHolderModel.status!.isNotEmpty &&
          createCardHolderModel.status != '0') {
        Get.back();
      } else {
        if (createCardHolderModel != null &&
            createCardHolderModel.message != null &&
            createCardHolderModel.message!.isNotEmpty) {
          CommonWidgets.snackBarView(title: createCardHolderModel.message!);
        } else {
          CommonWidgets.snackBarView(title: 'Please check your data');
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnBankName() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 10.px),
          backgroundColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(.9),
          title: Text(
            'Select Bank',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 18.px, fontWeight: FontWeight.w600),
          ),
          content: Obx(() {
            count.value;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<int>(
                  contentPadding: EdgeInsets.zero,
                  value: 1,
                  groupValue: selectedBank.value,
                  onChanged: (int? value) {
                    selectedBank.value = value!;
                    bankNameController.text = 'SafeHaven';
                    increment();
                    Get.back();
                  },
                  title: Text(
                    'SafeHaven',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                ),
                RadioListTile<int>(
                  contentPadding: EdgeInsets.zero,
                  value: 2,
                  groupValue: selectedBank.value,
                  onChanged: (int? value) {
                    selectedBank.value = value!;
                    bankNameController.text = 'WEMA';
                    increment();
                    Get.back();
                  },
                  title: Text(
                    'WEMA',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                ),
                RadioListTile<int>(
                  contentPadding: EdgeInsets.zero,
                  value: 3,
                  groupValue: selectedBank.value,
                  onChanged: (int? value) {
                    selectedBank.value = value!;
                    bankNameController.text = 'GTBank';
                    increment();
                    Get.back();
                  },
                  title: Text(
                    'GTBank',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                ),
                RadioListTile<int>(
                  contentPadding: EdgeInsets.zero,
                  value: 4,
                  groupValue: selectedBank.value,
                  onChanged: (int? value) {
                    selectedBank.value = value!;
                    bankNameController.text = 'Providus';
                    increment();
                    Get.back();
                  },
                  title: Text(
                    'Providus',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
