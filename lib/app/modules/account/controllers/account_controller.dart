import 'package:get/get.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class AccountController extends GetxController {
  final count = 0.obs;

  final cardIndex = 0.obs;

  bool showAvg = false;

  List listOfTra = [
    {
      'title': 'Sports',
      'sub_title': 'Payment',
      'amount': '15.99',
      'type': 'Withdraw',
      'icon': 'assets/icons/ic_withdraw.svg'
    },
    {
      'title': 'Bank of America',
      'sub_title': 'Deposit',
      'amount': '2,045.00',
      'type': 'Deposit',
      'icon': 'assets/icons/ic_deposit.svg'
    },
    {
      'title': 'To Brody Armando',
      'sub_title': 'Sent',
      'amount': '986.00',
      'type': 'Withdraw',
      'icon': 'assets/icons/ic_withdraw.svg'
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

  clickOnAddAccount() {
    Get.toNamed(Routes.ADD_NEW_BANK);
  }

  clickOnSwitch() {}
}
