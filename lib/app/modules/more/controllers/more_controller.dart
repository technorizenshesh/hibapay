import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/app/routes/app_pages.dart';

class MoreController extends GetxController {
  final count = 0.obs;

  List list = [
    {'title': StringConstants.deposit, 'icon': IconConstantsPng.icDeposit},
    {'title': StringConstants.transfers, 'icon': IconConstantsPng.icTransfers},
    {'title': StringConstants.withdraw, 'icon': IconConstantsPng.icWithdraw},
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
    {'title': StringConstants.rent, 'icon': IconConstantsPng.icRent},
    {'title': StringConstants.fasTag, 'icon': IconConstantsPng.icFastag},
    {'title': StringConstants.landline, 'icon': IconConstantsPng.icLandline},
    {'title': StringConstants.more, 'icon': IconConstantsPng.icMore},
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
