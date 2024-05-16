import 'package:HibaPay/app/routes/app_pages.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VirtualAccountController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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

  clickOnCopyIcon() async {
    await Clipboard.setData(
      ClipboardData(
        text: result?.virtualAccountDataBank ?? '',
      ),
    );
    Get.snackbar(
        margin: EdgeInsets.all(20.px), 'Massage', 'Copied to your clipboard !');
  }

  clickOnCreateVirtualAccount() {
    Get.toNamed(Routes.VIRTUAL_ACCOUNT_ADD);
  }
}
