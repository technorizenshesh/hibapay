import 'package:HibaPay/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: Center(
          child: CommonMethods.splashLogo(),
        ),
      );
    });
  }
}
