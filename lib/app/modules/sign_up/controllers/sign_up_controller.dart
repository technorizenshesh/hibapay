import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:hibapay/app/data/apis/api_methods/api_methods.dart';
import 'package:hibapay/app/data/apis/api_models/user_model.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:hibapay/common/time_picker_view.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;
  FocusNode focusFullName = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusStreetAddress = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusCountryOfResidence = FocusNode();
  FocusNode focusDateOfBirth = FocusNode();
  FocusNode focusPassword = FocusNode();
  final isFullName = false.obs;
  final icPhone = false.obs;
  final isEmail = false.obs;
  final isStreetAddress = false.obs;
  final isCity = false.obs;
  final isCountryOfResidence = false.obs;
  final isDateOfBirth = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryOfResidenceController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};
  DateTime? dateTime;

  final inAsyncCall = false.obs;
  final countryCode = 'IN'.obs;

  @override
  void onInit() {
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

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    icPhone.value = focusPhone.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isStreetAddress.value = focusStreetAddress.hasFocus;
    isCity.value = focusCity.hasFocus;
    isCountryOfResidence.value = focusCountryOfResidence.hasFocus;
    isDateOfBirth.value = focusDateOfBirth.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() async {
    if (fullNameController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        streetAddressController.text.trim().isNotEmpty &&
        cityController.text.trim().isNotEmpty &&
        countryCode.value.trim().isNotEmpty &&
        dateOfBirthController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.fullName: fullNameController.text,
        ApiKeyConstants.mobile: phoneController.text,
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.streetAddress: streetAddressController.text,
        ApiKeyConstants.city: cityController.text,
        ApiKeyConstants.country: countryCode.value,
        ApiKeyConstants.dob: dateOfBirthController.text,
        ApiKeyConstants.password: passwordController.text,
        ApiKeyConstants.confirmPassword: passwordController.text,
        ApiKeyConstants.countryCode: countryCode.value,
      };
      UserModel? userModel = await ApiMethods.signUp(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.status != null &&
          userModel.status != '0') {
        Get.back();
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusStreetAddress.addListener(onFocusChange);
    focusCity.addListener(onFocusChange);
    focusCountryOfResidence.addListener(onFocusChange);
    focusDateOfBirth.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryOfResidenceController.text = country.name;
        countryCode.value = country.countryCode;
      },
    );
  }

  clickOnCancelButton() {
    isCountryOfResidence.value = false;
    Get.back();
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }

  clickOnDob() async {
    dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
      firstDate: DateTime(2000),
    );
    if (dateTime != null) {
      dateOfBirthController.text = DateFormat('dd-MM-yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }
}
