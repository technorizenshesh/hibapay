import 'package:get/get.dart';

class GiftUserCardsController extends GetxController {
  final count = 0.obs;
  List list = [
    {'isOpen': 'yes'},
    {'isOpen': 'no'},
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

  clickOnCard({required int index}) {}
}
