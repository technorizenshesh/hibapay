import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

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
  final passwordHide = false.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryOfResidenceController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  clickOnSignUpButton() {
    // Get.toNamed(Routes.NAV_BAR);
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
    return showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.px),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Text(
                        'NGN',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                      SizedBox(width: 12.px),
                      Text(
                        'Nigeria',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                    ],
                  ),
                ),
              ),
              CommonWidgets.commonElevatedButton(
                onPressed: () => clickOnCancelButton(),
                child: Text(
                  StringConstants.cancel,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      isCountryOfResidence.value = false;
    });
  }

  clickOnCancelButton() {
    isCountryOfResidence.value = false;
    Get.back();
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }
}
