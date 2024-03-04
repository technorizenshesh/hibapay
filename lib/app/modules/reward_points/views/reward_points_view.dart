import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../controllers/reward_points_controller.dart';

class RewardPointsView extends GetView<RewardPointsController> {
  const RewardPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.rewardPoints),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.px),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.px),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.myRewardsPoints,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 20.px),
                  ),
                  SizedBox(height: 8.px),
                  Text(
                    '200 ${StringConstants.points}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.px,
                        ),
                  ),
                  SizedBox(height: 8.px),
                  Container(
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.px),
                      gradient: LinearGradient(
                        end: Alignment.topRight,
                        begin: Alignment.bottomLeft,
                        colors: [
                          Theme.of(Get.context!).colorScheme.secondary,
                          Theme.of(Get.context!).colorScheme.onSecondary,
                        ],
                      ),
                    ),
                    child: Text(
                      StringConstants.redeemPoints,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.px),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.px),
                border: Border.all(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(children: [
                    CommonMethods.appIconsPng(
                        assetName: IconConstantsPng.icCoin),
                    SizedBox(width: 8.px),
                    Column(
                      children: [
                        Text(
                          StringConstants.adventurous,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                        SizedBox(height: 8.px),
                        Text(
                          StringConstants.earnThreeHundredEightyPointsToEach,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(height: 14.px),
                  Text(
                    StringConstants.yourRankProgress,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  SizedBox(height: 14.px),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        children: [
                          AnimatedProgressBar(
                            value: .7,
                            duration: const Duration(seconds: 3),
                            gradient: LinearGradient(
                              end: Alignment.topRight,
                              begin: Alignment.bottomLeft,
                              colors: [
                                Theme.of(Get.context!).colorScheme.secondary,
                                Theme.of(Get.context!).colorScheme.onSecondary,
                              ],
                            ),
                            height: 14.px,
                            width: double.infinity,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(.2.px),
                          ),
                          CommonMethods.appIconsPng(
                              height: 14.px,
                              assetName: ImgConstants.imgProgressBubbles,
                              width: double.infinity)
                        ],
                      ),
                      Text(
                        "350/500",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 10.px),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.px),
            Text(
              StringConstants.rewardsPointRules,
              style: Theme.of(Get.context!)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 20.px),
            ),
            SizedBox(height: 10.px),
            Expanded(
              child: ListView.builder(
                itemCount: controller.listOfListTile.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.px),
                    child: ListTile(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.px),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.surface,
                          width: .2.px,
                        ),
                      ),
                      title: Text(
                        controller.listOfListTile[index],
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 14.px),
            CommonWidgets.commonElevatedButton(
              buttonColor: Theme.of(context).colorScheme.onError,
              onPressed: () =>
                  controller.clickOnInviteFriendsFivePointsButton(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 24.px),
                  SizedBox(width: 8.px),
                  Text(
                    StringConstants.inviteFriendsFivePoints,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
    );
  }
}
