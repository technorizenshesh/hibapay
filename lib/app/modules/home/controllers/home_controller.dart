import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;

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

  List list = [
    {'title': StringConstants.recharge, 'icon': IconConstantsPng.icRecharge},
    {'title': StringConstants.cableTV, 'icon': IconConstantsPng.icCableTv},
    {'title': StringConstants.data, 'icon': IconConstantsPng.icData},
    {
      'title': StringConstants.electricity,
      'icon': IconConstantsPng.icElectricity
    },
    {'title': StringConstants.internet, 'icon': IconConstantsPng.icInternet},
    {'title': StringConstants.betting, 'icon': IconConstantsPng.icBetting},
    {'title': StringConstants.giftUser, 'icon': IconConstantsPng.icGiftUser},
    {'title': StringConstants.withdraw, 'icon': IconConstantsPng.icWithdraw},
  ];

  final cardIndex = 0.obs;

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

  clickOnTransfers() {
    Get.toNamed(Routes.TRANSFER);
  }

  clickOnWithdraw() {
    Get.toNamed(Routes.WITHDRAW);
  }

  clickOnMore() {
    Get.toNamed(Routes.MORE);
  }

  clickOnAllTransactions() {
    Get.toNamed(Routes.ALL_TRANSACTIONS);
  }

  clickOnNotificationIcon() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  clickOnWallet() {
    Get.toNamed(Routes.WALLET);
  }

  clickOnDeposit() {
    Get.toNamed(Routes.DEPOSIT);
  }

  clickOnSpinnerIcon() {
    Get.toNamed(Routes.SPINNER);
  }

  clickOnCard({required int index}) {
    switch (list[index]['title']) {
      case StringConstants.electricity:
        Get.toNamed(Routes.ELECTRICITY,
            parameters: {'title': StringConstants.electricity});
        break;
      case StringConstants.cableTV:
        Get.toNamed(Routes.CABLE_TV,
            parameters: {'title': StringConstants.electricity});
        break;
      case StringConstants.betting:
        Get.toNamed(Routes.BETTING,
            parameters: {'title': StringConstants.electricity});
        break;
      case StringConstants.giftUser:
        Get.toNamed(Routes.GIFT_USER,
            parameters: {'title': StringConstants.electricity});
        break;
      case StringConstants.recharge ||
            StringConstants.internet ||
            StringConstants.data:
        Get.toNamed(Routes.RECHARGE,
            parameters: {'title': list[index]['title']});
        break;
      case StringConstants.more:
        Get.toNamed(Routes.BIL_PAYMENT,
            parameters: {'title': list[index]['title']});
        break;
      case StringConstants.rent:
        Get.toNamed(Routes.RENT, parameters: {'title': list[index]['title']});
        break;
      case StringConstants.withdraw:
        Get.toNamed(Routes.WITHDRAW,
            parameters: {'title': list[index]['title']});
        break;
    }
  }
}
