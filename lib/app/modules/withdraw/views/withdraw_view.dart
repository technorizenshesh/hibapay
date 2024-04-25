import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.withdraw),
          bottomNavigationBar: controller.listVirtualCardsResult.isNotEmpty
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnWithdrawButton(),
                    child: Text(
                      StringConstants.withdraw,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              : null,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: controller.listVirtualCardsResult.isNotEmpty
                ? ListView(
                    children: [
                      SizedBox(height: 24.px),
                      if (controller.listVirtualCardsResult.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.listVirtualCardsResult.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.px),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.surface,
                                  width: .4.px,
                                ),
                              ),
                              trailing: CommonMethods.appIcons(
                                  assetName: IconConstants.icRightArrow),
                              subtitle: Text(
                                controller.listVirtualCardsResult[index]
                                        .vcardCardNumber ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                              title: Text(
                                controller.listVirtualCardsResult[index]
                                        .vcardName ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(24.px),
                                child: Image.asset(
                                  'assets/images/img_logo.png',
                                  height: 48.px,
                                  width: 48.px,
                                ),
                              ),
                            );
                          },
                        ),
                      SizedBox(height: 40.px),
                      Center(
                        child: SizedBox(
                          width: 180.px,
                          child: Center(
                            child: TextField(
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 40.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: controller.amountController,
                              decoration: InputDecoration(
                                prefixIcon: Text(
                                  '₦  ',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 40.px,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                hintText: '. . . .',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 40.px,
                                        fontWeight: FontWeight.w700),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        'Maximum ₦ ${controller.balance.value}',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                      ),
                      SizedBox(height: 40.px),
                      SizedBox(
                        height: 60.px,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () =>
                                controller.clickOnPercentage(index: index),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: controller.selectedValue.value == index
                                    ? Container(
                                        decoration: BoxDecoration(
                                          gradient: CommonMethods
                                              .commonLinearGradientView(),
                                          borderRadius:
                                              BorderRadius.circular(12.px),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.px,
                                            horizontal: 20.px,
                                          ),
                                          child: Text(
                                            '${controller.percentageList[index]} %',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 14.px,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.px,
                                          horizontal: 20.px,
                                        ),
                                        child: Text(
                                          '${controller.percentageList[index]} %',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          itemCount: controller.percentageList.length,
                        ),
                      ),
                      SizedBox(height: 40.px),
                    ],
                  )
                : controller.getCardTransactionsModel == null
                    ? const SizedBox()
                    : Center(child: CommonMethods.dataNotFound()),
          ),
        ),
      );
    });
  }
}
