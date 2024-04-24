import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetPinController extends GetxController {
  final count = 0.obs;
  FocusNode focusYourPin = FocusNode();
  FocusNode focusRetypePin = FocusNode();
  FocusNode focusYourHibaPayPassword = FocusNode();
  final isYourPin = false.obs;
  final isRetypePin = false.obs;
  final isYourHibaPayPassword = false.obs;
  final yourPinHide = true.obs;
  final retypePinHide = true.obs;
  final yourHibaPayPasswordHide = true.obs;
  TextEditingController yourPinController = TextEditingController();
  TextEditingController retypePinController = TextEditingController();
  TextEditingController yourHibaPayPasswordController = TextEditingController();
  Map<String, dynamic> bodyParams = {};
  DateTime? dateTime;

  final inAsyncCall = false.obs;

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

  void startListener() {
    focusYourPin.addListener(onFocusChange);
    focusRetypePin.addListener(onFocusChange);
    focusYourHibaPayPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isYourPin.value = focusYourPin.hasFocus;
    isRetypePin.value = focusRetypePin.hasFocus;
    isYourHibaPayPassword.value = focusYourHibaPayPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnSetAccountPinButton() async {
    if (yourPinController.text.trim().isNotEmpty &&
        retypePinController.text.trim().isNotEmpty &&
        yourHibaPayPasswordController.text.trim().isNotEmpty) {
      if (yourPinController.text.trim() == retypePinController.text.trim()) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setBool(StringConstants.isLock, false);
        sp.setString(StringConstants.isLockPin,
            yourPinController.text.trim().toString());
        showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              content: Padding(
                padding: EdgeInsets.all(16.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20.px,
                            color: Colors.black.withOpacity(.2),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.px),
                        child: Icon(Icons.done,
                            color: Theme.of(context).primaryColor, size: 60.px),
                      ),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'Great!',
                      textAlign: TextAlign.center,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 24.px),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      'Your account pin is created!',
                      textAlign: TextAlign.center,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16.px),
                    ),
                    SizedBox(height: 40.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      // buttonColor: Theme.of(context).colorScheme.onError,
                      child: Text(
                        StringConstants.awesome,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        Get.snackbar(
            margin: EdgeInsets.all(20.px),
            'Error',
            "Don't match PIN and Retype field");
      }
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnYourPinHideEyeButton() {
    yourPinHide.value = !yourPinHide.value;
  }

  clickOnRetypePinEyeButton() {
    retypePinHide.value = !retypePinHide.value;
  }

  clickOnYourHibaPayPasswordEyeButton() {
    yourHibaPayPasswordHide.value = !yourHibaPayPasswordHide.value;
  }
}
