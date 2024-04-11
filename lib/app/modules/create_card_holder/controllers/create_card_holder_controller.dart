import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/create_card_holder_model.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateCardHolderController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final isAddress = false.obs;
  final isState = false.obs;
  final isCountry = false.obs;
  final isPostalCode = false.obs;
  final isBvn = false.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController bvnController = TextEditingController();

  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusAddress = FocusNode();
  FocusNode focusState = FocusNode();
  FocusNode focusCountry = FocusNode();
  FocusNode focusPostalCode = FocusNode();
  FocusNode focusBvn = FocusNode();

  Map<String, dynamic> bodyParams = {};
  final authTokenHiba = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusFirstName.addListener(onFocusChange);
    focusLastName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusAddress.addListener(onFocusChange);
    focusState.addListener(onFocusChange);
    focusCountry.addListener(onFocusChange);
    focusPostalCode.addListener(onFocusChange);
    focusBvn.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isAddress.value = focusAddress.hasFocus;
    isState.value = focusState.hasFocus;
    isCountry.value = focusCountry.hasFocus;
    isPostalCode.value = focusPostalCode.hasFocus;
    isBvn.value = focusBvn.hasFocus;
  }

  void increment() => count.value++;

  clickOnCreateButton() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    if (firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty &&
        stateController.text.trim().isNotEmpty &&
        countryController.text.trim().isNotEmpty &&
        postalCodeController.text.trim().isNotEmpty &&
        bvnController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.firstName: firstNameController.text,
        ApiKeyConstants.lastName: lastNameController.text,
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.phone: phoneController.text,
        ApiKeyConstants.address: addressController.text,
        ApiKeyConstants.state: stateController.text,
        ApiKeyConstants.country: countryController.text,
        ApiKeyConstants.postalCode: postalCodeController.text,
        ApiKeyConstants.kycMethod: ApiKeyConstants.selfieImageCapital,
        ApiKeyConstants.bvn: bvnController.text,
        ApiKeyConstants.selfieImage:
            'https://server-php-8-3.technorizen.com/test.png',
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      CreateCardHolderModel? createCardHolderModel =
          await ApiMethods.createCardHolder(bodyParams: bodyParams);
      if (createCardHolderModel != null &&
          createCardHolderModel.result != null) {
        Get.back();
      } else {
        CommonWidgets.snackBarView(title: 'Please check your data');
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryController.text = country.name;
        // countryCode.value = country.countryCode;
      },
    );
  }
}
