import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/send_money_controller.dart';

class SendMoneyView extends GetView<SendMoneyController> {
  const SendMoneyView({Key? key}) : super(key: key);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(50.px),
                child: Image.asset(
                  'assets/images/img_logo.png',
                  height: 100.px,
                  width: 100.px,
                ),
              ),
              SizedBox(height: 24.px),
              Center(
                child: Text(
                  'to Linda',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(height: 40.px),
              Container(
                padding: EdgeInsets.all(12.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.px),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: .4.px,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.enterAmount,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                        Text(
                          'Max ${CommonMethods.cur}12,652.00',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'USD',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 16.px,
                                  ),
                        ),
                        SizedBox(width: 16.px),
                        Text(
                          '865,0',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 24.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSendMoneyButton(),
                child: Text(
                  StringConstants.sendMoney,
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
