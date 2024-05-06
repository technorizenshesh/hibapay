import 'dart:convert';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/time_picker_view.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;
  FocusNode focusFullName = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusReferral = FocusNode();
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
  final isReferral = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryOfResidenceController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};
  DateTime? dateTime;

  final inAsyncCall = false.obs;
  final countryCode = 'IN'.obs;
  final otp = ''.obs;

  TextEditingController pin = TextEditingController();

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
    isReferral.value = focusReferral.hasFocus;
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
      bodyParams.clear();
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
        ApiKeyConstants.referralUserId: referralController.text,
        ApiKeyConstants.image: '',
      };
      inAsyncCall.value = true;
      UserModel? userModel =
          await ApiMethods.signUpOtpRequest(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.status != null &&
          userModel.status == '1') {
        inAsyncCall.value = false;
        await checkVerification();
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Massage',
              userModel.message.toString());
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
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
    focusReferral.addListener(onFocusChange);
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

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }

  clickOnDob() async {
    dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(1940),
      firstDate: DateTime(1940),
    );
    if (dateTime != null) {
      dateOfBirthController.text = DateFormat('dd-MM-yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }

  checkVerification() {
    return showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.px),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.verification,
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                            fontSize: 20.px,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                ),
                SizedBox(height: 40.px),
                CommonWidgets.commonOtpView(
                  controller: pin,
                  height: 60.px,
                  width: 60.px,
                ),
                SizedBox(height: 40.px),
                TextButton(
                  onPressed: () => clickOnSubmit(),
                  child: Text(
                    StringConstants.submit,
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
        );
      },
    );
  }

  clickOnSubmit() async {
    if (pin.text.trim().isNotEmpty) {
      bodyParams.clear();
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
        ApiKeyConstants.referralUserId: referralController.text,
        ApiKeyConstants.otp: pin.text,
        ApiKeyConstants.image: '',
      };
      inAsyncCall.value = true;
      UserModel? userModel =
          await ApiMethods.signUpOtpRequestVerify(bodyParams: bodyParams);
      Get.back();
      if (userModel != null &&
          userModel.status != null &&
          userModel.status == '1') {
        await signUp();
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Massage',
              userModel.message.toString());
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
        margin: EdgeInsets.all(20.px),
        'Massage',
        'OTP field Empty',
      );
    }
  }

  signUp() async {
    UserModel? userModel = await ApiMethods.signUp(bodyParams: bodyParams);
    if (userModel != null &&
        userModel.result != null &&
        userModel.result!.id != null &&
        userModel.result!.id!.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(ApiKeyConstants.userId, userModel.result?.id ?? '');
      sp.setString(
          ApiKeyConstants.authTokenHiba, "Bearer ${userModel.token ?? ''}");
      sp.setString(ApiKeyConstants.result, jsonEncode(userModel.result));
      Get.toNamed(Routes.VERIFY_IDENTITY);
    } else {
      if (userModel != null &&
          userModel.message != null &&
          userModel.message!.isNotEmpty) {
        Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'Massage',
          userModel.message.toString(),
        );
      } else {
        Get.snackbar(
          margin: EdgeInsets.all(20.px),
          'Massage',
          'Server down',
        );
      }
    }
  }
}
