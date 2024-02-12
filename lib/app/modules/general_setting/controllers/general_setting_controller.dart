import 'package:get/get.dart';

class GeneralSettingController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;

  List listOfListTileTitles = [
    {
      'title': 'Default Notification Actions',
      'sub_title': 'You want to receive bill reminders before a bill is due.',
      'check': true,
    },
    {
      'title': 'Bills Calendar',
      'sub_title': 'You want to receive bill reminder emails before a bill...',
      'check': true,
    },
    {
      'title': 'Credit Score Calendar',
      'sub_title': 'You want to sync credit score reminders tou your device cale...',
      'check': true,
    },
  ];

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
}
