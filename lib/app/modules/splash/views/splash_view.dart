import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upgrader/upgrader.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return UpgradeAlert(
        dialogStyle: UpgradeDialogStyle.cupertino,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
              colors: [
                Theme.of(Get.context!).colorScheme.secondary,
                Theme.of(Get.context!).colorScheme.onSecondary,
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              ImgConstants.imgLogoWhite,
              height: 84.px,
              width: 200.px,
            ),
          ),
        ),
      );
    });
  }
}
