import 'dart:async';
import 'dart:convert';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
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
  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusReferral = FocusNode();
  FocusNode focusStreetAddress = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusCountryOfResidence = FocusNode();
  FocusNode focusDateOfBirth = FocusNode();
  FocusNode focusPassword = FocusNode();
  final isFirstName = false.obs;
  final isLstName = false.obs;
  final isLastName = false.obs;
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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryOfResidenceController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> bodyParamsForResend = {};
  DateTime? dateTime;

  final inAsyncCall = false.obs;
  final countryCode = 'IN'.obs;
  final otp = ''.obs;

  TextEditingController pin = TextEditingController();

  late Timer timer;
  final seconds = 0.obs;

  final isBvn = false.obs;
  final isNin = false.obs;

  TextEditingController bvnController = TextEditingController();
  TextEditingController ninController = TextEditingController();

  FocusNode focusBvn = FocusNode();
  FocusNode focusNin = FocusNode();

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
    timer.cancel();
    super.onClose();
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    icPhone.value = focusPhone.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isStreetAddress.value = focusStreetAddress.hasFocus;
    isCity.value = focusCity.hasFocus;
    isCountryOfResidence.value = focusCountryOfResidence.hasFocus;
    isDateOfBirth.value = focusDateOfBirth.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isReferral.value = focusReferral.hasFocus;
    isBvn.value = focusBvn.hasFocus;
    isNin.value = focusNin.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() async {
    if (firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        streetAddressController.text.trim().isNotEmpty &&
        cityController.text.trim().isNotEmpty &&
        countryCode.value.trim().isNotEmpty &&
        dateOfBirthController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      // bodyParamsForResend.clear();
      bodyParams.clear();
      bodyParams = {
        ApiKeyConstants.fullName: '',
        ApiKeyConstants.firstName: firstNameController.text,
        ApiKeyConstants.lastName: lastNameController.text,
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
        ApiKeyConstants.bvn: '' /*bvnController.text*/,
        ApiKeyConstants.nin: '' /*ninController.text*/,
      };
      /*bodyParamsForResend = {
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
      UserModel? userModel =
          await ApiMethods.signUpOtpRequest(bodyParams: bodyParamsForResend);
      if (userModel != null &&
          userModel.status != null &&
          userModel.status == '1') {
        inAsyncCall.value = false;
        startTimer();
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
      }*/
      inAsyncCall.value = true;
      await signUp();
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
    focusFirstName.addListener(onFocusChange);
    focusLastName.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusStreetAddress.addListener(onFocusChange);
    focusCity.addListener(onFocusChange);
    focusCountryOfResidence.addListener(onFocusChange);
    focusDateOfBirth.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusReferral.addListener(onFocusChange);
    focusNin.addListener(onFocusChange);
    focusBvn.addListener(onFocusChange);
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
    Get.bottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      isDismissible: false,
      Obx(() {
        count.value;
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.px),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      StringConstants.verification,
                      textAlign: TextAlign.center,
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
                SizedBox(height: 20.px),
                Text(
                  'Please enter the OTP you received in your email to verify; you can find it in your inbox or spam folder.',
                  textAlign: TextAlign.start,
                  style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                      fontSize: 12.px,
                      color: Theme.of(Get.context!).primaryColor),
                ),
                SizedBox(height: 20.px),
                CommonWidgets.commonOtpView(
                  controller: pin,
                  height: 60.px,
                  width: 60.px,
                ),
                SizedBox(height: 40.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => clickOnVerify(),
                  child: Text(
                    StringConstants.verify,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 20.px),
                TextButton(
                  onPressed: () =>
                      seconds.value == 0 ? clickOnResendOtp() : null,
                  child: Text(
                    seconds.value == 0
                        ? StringConstants.resendOtp
                        : 'Please wait for ${seconds.value} seconds before resending the code',
                    textAlign: TextAlign.center,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                            fontSize: 16.px,
                            color: Theme.of(Get.context!).primaryColor),
                  ),
                ),
                SizedBox(height: 40.px),
              ],
            ),
          ),
        );
      }),
    );
  }

  clickOnCrossIcon() {
    Get.back();
  }

  void startTimer() {
    seconds.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
        increment();
      } else {
        timer.cancel();
        increment();
      }
    });
  }

  clickOnVerify() async {
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
      if (userModel != null &&
          userModel.status != null &&
          userModel.status == '1') {
        pin.text = '';
        increment();
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
      //Get.toNamed(Routes.VERIFY_IDENTITY);
      Get.back();
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

  clickOnResendOtp() async {
    pin.text = '';
    startTimer();
    increment();
    UserModel? userModel =
        await ApiMethods.signUpOtpRequest(bodyParams: bodyParamsForResend);
    if (userModel != null &&
        userModel.status != null &&
        userModel.status == '1') {
      inAsyncCall.value = false;
      Get.snackbar(margin: EdgeInsets.all(20.px), 'Massage', 'Check you mail');
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
  }
}
