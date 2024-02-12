import 'package:get/get.dart';

class NotificationController extends GetxController {
  final count = 0.obs;

  List listOfTra = [
    {
      'title': 'Rewards',
      'sub_title': 'Loyal user rewards!😘',
      'time': '5m ago',
      'icon': 'assets/icons/ic_withdraw.svg'
    },
    {
      'title': 'Money Transfer',
      'sub_title': 'You have successfully sent money to Maria of...',
      'time': '25m ago',
      'icon': 'assets/icons/ic_deposit.svg'
    },
    {
      'title': 'Payment Notification',
      'sub_title': 'Successfully paid!🤑',
      'time': 'Mar 20',
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
}
