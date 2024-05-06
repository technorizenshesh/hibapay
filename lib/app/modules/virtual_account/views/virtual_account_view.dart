import 'dart:ui';

import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/virtual_account_controller.dart';

class VirtualAccountView extends GetView<VirtualAccountController> {
  const VirtualAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.virtualAccount),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.px),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18.px),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topRight,
                      begin: Alignment.bottomLeft,
                      colors: [
                        Theme.of(Get.context!).colorScheme.secondary,
                        Theme.of(Get.context!).colorScheme.onSecondary,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.px),
                    ),
                    border: Border.all(
                      width: .4.px,
                      color: Theme.of(Get.context!)
                          .scaffoldBackgroundColor
                          .withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.virtualAccount,
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    // fontSize: 20.px,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                            Text(
                              result?.virtualAccountDataBankName ?? '',
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    // fontSize: 20.px,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.px),
                        Container(
                          padding: EdgeInsets.all(10.px),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(.2.px),
                            borderRadius: BorderRadius.circular(30.px),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                result?.virtualAccountDataAccountNumber ?? '',
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      // fontSize: 20.px,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                              ),
                              SizedBox(width: 8.px),
                              GestureDetector(
                                onTap: () => controller.clickOnCopyIcon(),
                                child: CommonMethods.appIcons(
                                  assetName: IconConstants.icCopyWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.px),
                        Text(
                          '${result?.firstName ?? ''} ${result?.lastName ?? ''}',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                // fontSize: 20.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
