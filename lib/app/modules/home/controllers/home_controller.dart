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
    {'title': StringConstants.paidGas, 'icon': IconConstantsPng.icPaidGas},
    {'title': StringConstants.water, 'icon': IconConstantsPng.icWater},
    {'title': StringConstants.wifi, 'icon': IconConstantsPng.icWifi},
    {'title': StringConstants.dTH, 'icon': IconConstantsPng.icDth},
    {
      'title': StringConstants.electricity,
      'icon': IconConstantsPng.icElectricity
    },
    {'title': StringConstants.fasTag, 'icon': IconConstantsPng.icFasTag},
    {'title': StringConstants.rent, 'icon': IconConstantsPng.icRent},
    {'title': StringConstants.landline, 'icon': IconConstantsPng.icLandline},
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
      case StringConstants.recharge || StringConstants.dTH:
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
    }
  }
}
