import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/send_money_successfully_controller.dart';

class SendMoneySuccessfullyView
    extends GetView<SendMoneySuccessfullyController> {
  const SendMoneySuccessfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.sendMoney),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 40.px),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.px),
                child: Image.asset(
                  ImgConstants.imgTransferSuccessful,
                  height: 180.px,
                ),
              ),
              SizedBox(height: 40.px),
              Text(
                StringConstants.transferSuccessful,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 24.px, color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 14.px),
              Text(
                StringConstants
                    .transfersAreReviewedWhichMayResultInDelaysOrFundsBeingFrozen,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 40.px),
              Text(
                '${CommonMethods.cur} 865.10',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 24.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnBackToHomeButton(),
                child: Text(
                  StringConstants.backToHome,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 24.px),
            ],
          ),
        ),
      );
    });
  }
}
