import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/receiving_account_controller.dart';

class ReceivingAccountView extends GetView<ReceivingAccountController> {
  const ReceivingAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.receivingAccount),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 40.px),
              gradientText(
                  title: StringConstants.accountHolder,
                  subTitle: 'Maikel Alexander'),
              gradientText(
                  title: StringConstants.accountNumber,
                  subTitle: '40630179736872771'),
              gradientText(
                  title: StringConstants.bankName,
                  subTitle: 'Revolut Bank UAB'),
              gradientText(
                  title: StringConstants.swiftCode, subTitle: 'CLJUGBZTOK'),
              gradientText(
                  title: StringConstants.iban,
                  subTitle: 'GB28CJU04130762684586'),
              gradientText(
                  title: StringConstants.address,
                  subTitle: '16 Mortimer Street London, WIT 331 United...'),
              SizedBox(height: 24.px),
            ],
          ),
        ),
      );
    });
  }

  gradientText({required String title, required String subTitle}) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonMethods.textViewLinearGradient(
            text: title,
          ),
        ],
      ),
      subtitle: Text(
        subTitle,
        maxLines: 2,
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 14.px),
      ),
      trailing: CommonMethods.appIconsPng(
        assetName: IconConstantsPng.icCopy,
        height: 24.px,
        width: 24.px,
      ),
    );
  }
}
