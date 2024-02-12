import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/common_methods.dart';
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
