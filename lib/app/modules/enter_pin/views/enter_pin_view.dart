import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/enter_pin_controller.dart';

class EnterPinView extends GetView<EnterPinController> {
  const EnterPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.px, vertical: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.px),
                      CommonMethods.appIconsPng(
                        assetName: IconConstantsPng.icKey,
                        height: 100.px,
                        width: 100.px,
                      ),
                      SizedBox(height: 40.px),
                      Text(
                        'Welcome back ${result?.firstName ?? 'user'}!\nEnter your account PIN to continue',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonOtpView(
                        controller: controller.pin,
                        height: 60.px,
                        width: 60.px,
                        autoDismissKeyboard: true,
                        enablePinAutofill: true,
                        onChanged: (value) {
                          if (value.length == 4) {
                            print('value:::::::::::::::::::$value');
                          }
                        },
                      ),
                      SizedBox(height: 40.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
