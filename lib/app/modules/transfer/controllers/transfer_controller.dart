import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class TransferController extends GetxController {
  final count = 0.obs;
  List listOfCard = [
    'assets/un_used_images/card01.png',
    'assets/un_used_images/card02.png'
  ];

  List listOfCon = [
    {
      'title': 'Davis Geidt',
      'sub_title': '7894561235',
      'icon': 'assets/images/img_logo.png'
    },
    {
      'title': 'Johns',
      'sub_title': '9567891235',
      'icon': 'assets/images/img_logo.png'
    },
    {
      'title': 'Lady',
      'sub_title': '8561238754',
      'icon': 'assets/images/img_logo.png'
    },
  ];

  TextEditingController searchController = TextEditingController();

  final selectedCard = 0.obs;

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

  clickOnSendMoneyByEmailButton() {
    Get.toNamed(Routes.SEND_MONEY);
  }

  clickOnCard({required int index}) {
    selectedCard.value = index;
    increment();
    Get.toNamed(Routes.ADD_BANK_ACCOUNT);
  }
}
