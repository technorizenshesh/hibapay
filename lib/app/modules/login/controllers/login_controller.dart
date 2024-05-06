import 'dart:convert';
import 'dart:io';

import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_banners_model.dart';
import 'package:HibaPay/app/data/apis/api_models/get_services_hibapay_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final icPhone = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;
  final isEmail = false.obs;
  final countryCode = 'IN'.obs;
  final authTokenHiba = ''.obs;
  final deviceToken = ''.obs;
  final deviceType = ''.obs;
  final type = ''.obs;
  final countryCodeShow = '+91'.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode focusPhone = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusEmail = FocusNode();
  Map<String, dynamic> queryParameters = {};
  final inAsyncCall = false.obs;
  final selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    startListener();
    if (Platform.isIOS) {
      deviceType.value = ApiKeyConstants.ios;
      print('is a IOS');
    } else if (Platform.isAndroid) {
      deviceType.value = ApiKeyConstants.android;
      print('is a Andriod');
    } else {}
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

  clickOnForgotYourPasswordButton() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

/*  clickOnLoginButton1() async {
    if (passwordController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        countryCode.value.trim().isNotEmpty) {
      inAsyncCall.value = true;
      String input = phoneController.text;
      if (isNumeric(input)) {
        type.value = ApiKeyConstants.mobile;
      } else if (isEmailMethod(input)) {
        type.value = ApiKeyConstants.email;
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px),
            'Message',
            'The entered string is neither a number nor an email.');
      }
      queryParameters = {
        // ApiKeyConstants.mobile: '${countryCode.value}-${phoneController.text}',
        ApiKeyConstants.mobile: phoneController.text,
        ApiKeyConstants.password: passwordController.text,
        ApiKeyConstants.type: type.value,
      };
      UserModel? userModel = await ApiMethods.login(
        queryParameters: queryParameters,
      );
      if (userModel != null &&
          userModel.result != null &&
          userModel.result!.otp != null &&
          userModel.result!.otp!.isNotEmpty) {
        if (userModel.result != null) {
          Get.toNamed(Routes.CHECK_YOUR_MAIL, parameters: {
            ApiKeyConstants.otp: userModel.result!.otp ?? '',
            ApiKeyConstants.mobile:
                '${countryCode.value}-${phoneController.text}'
          });
        }
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Error',
              userModel.message.toString());
        } else {
          Get.snackbar(margin: EdgeInsets.all(20.px), 'Error', 'Server down');
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }*/

  clickOnLoginButton() async {
    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    firebaseMessaging.getToken().then((token) {
      print('token :::::::::::::::::::${token}');
      deviceToken.value = token.toString();
    });
    if (selectedTab.value != 0) {
      if (phoneController.text.trim().isNotEmpty &&
          countryCode.value.trim().isNotEmpty &&
          passwordController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        queryParameters = {
          ApiKeyConstants.mobile:
              '${countryCode.value}-${phoneController.text}',
          ApiKeyConstants.password: passwordController.text,
          ApiKeyConstants.deviceType: deviceType.value,
          ApiKeyConstants.deviceToken: deviceToken.value,
        };
        UserModel? userModel = await ApiMethods.loginMobile(
          queryParameters: queryParameters,
        );
        if (userModel != null &&
            userModel.token != null &&
            userModel.token!.isNotEmpty) {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString(
              ApiKeyConstants.authTokenHiba, "Bearer ${userModel.token ?? ''}");
          sp.setString(
              ApiKeyConstants.result, jsonEncode(userModel.result ?? ''));
          CommonMethods.unFocsKeyBoard();
          if (userModel.result != null) {
            result = userModel.result!;
            increment();
            if (result != null &&
                result?.udocSelfyPhotoStatus != null &&
                result!.udocSelfyPhotoStatus!.isNotEmpty) {
              await onInitWorking();
              Get.offAllNamed(Routes.NAV_BAR);
            } else {
              if (result != null &&
                  result!.id != null &&
                  result!.id!.isNotEmpty) {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString(ApiKeyConstants.userId, result?.id ?? '');
                Get.toNamed(Routes.VERIFY_IDENTITY);
              }
            }
          }
        } else {
          if (userModel != null &&
              userModel.message != null &&
              userModel.message!.isNotEmpty) {
            Get.snackbar(
                margin: EdgeInsets.all(20.px),
                'Error',
                userModel.message.toString());
          } else {
            Get.snackbar(
                margin: EdgeInsets.all(20.px), 'Error', 'Check connection');
          }
        }
        inAsyncCall.value = false;
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', 'All field required');
      }
    } else {
      if (emailController.text.trim().isNotEmpty &&
          passwordController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        queryParameters = {
          ApiKeyConstants.email: emailController.text,
          ApiKeyConstants.password: passwordController.text,
          ApiKeyConstants.deviceType: deviceType.value,
          ApiKeyConstants.deviceToken: deviceToken.value,
        };
        UserModel? userModel = await ApiMethods.login(
          queryParameters: queryParameters,
        );
        if (userModel != null &&
            userModel.token != null &&
            userModel.token!.isNotEmpty) {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString(
              ApiKeyConstants.authTokenHiba, "Bearer ${userModel.token ?? ''}");
          sp.setString(
              ApiKeyConstants.result, jsonEncode(userModel.result ?? ''));
          authTokenHiba.value = "Bearer ${userModel.token ?? ''}";
          CommonMethods.unFocsKeyBoard();
          if (userModel.result != null) {
            result = userModel.result!;
            increment();
            if (result != null &&
                result?.udocSelfyPhotoStatus != null &&
                result!.udocSelfyPhotoStatus!.isNotEmpty) {
              await onInitWorking();
              Get.offAllNamed(Routes.NAV_BAR);
            } else {
              if (result != null &&
                  result!.id != null &&
                  result!.id!.isNotEmpty) {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString(ApiKeyConstants.userId, result?.id ?? '');
                Get.toNamed(Routes.VERIFY_IDENTITY);
              }
            }
          }
        } else {
          if (userModel != null &&
              userModel.message != null &&
              userModel.message!.isNotEmpty) {
            Get.snackbar(
                margin: EdgeInsets.all(20.px),
                'Error',
                userModel.message.toString());
          } else {
            Get.snackbar(
                margin: EdgeInsets.all(20.px), 'Error', 'Check connection');
          }
        }
        /* if (userModel != null &&
            userModel.result != null &&
            userModel.result!.otp != null &&
            userModel.result!.otp!.isNotEmpty) {
          if (userModel.result != null) {
            Get.toNamed(Routes.CHECK_YOUR_MAIL, parameters: {
              ApiKeyConstants.otp: userModel.result!.otp ?? '',
              ApiKeyConstants.mobile:
                  '${countryCode.value}-${phoneController.text}'
            });
          }
        }*/
        inAsyncCall.value = false;
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px), 'Error', 'All field required');
      }
    }
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  bool isEmailMethod(String s) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(s);
  }

  clickOnResetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
  }

  void onFocusChange() {
    icPhone.value = focusPhone.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isEmail.value = focusEmail.hasFocus;
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryCode.value = country.countryCode;
        countryCodeShow.value = "+ ${country.phoneCode}";
      },
    );
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }

  clickOnTabs({required int value}) async {
    selectedTab.value = value;
  }

  onInitWorking() async {
    await getBannersApi();
    await getServicesApi();
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
}
