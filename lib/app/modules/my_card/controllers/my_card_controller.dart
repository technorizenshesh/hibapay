import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class MyCardController extends GetxController {
  final count = 0.obs;

  List listOfCard = [
    'assets/un_used_images/card01.png',
    'assets/un_used_images/card02.png'
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

  clickOnAddNewCard() {
    Get.toNamed(Routes.ADD_NEW_CARD);
  }
}
