import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/referral_controller.dart';

class ReferralView extends GetView<ReferralController> {
  const ReferralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.referral),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 40.px),
              Text(
                StringConstants.referYourFriendsEarnCashback,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 14.px),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.px),
                    gradient: LinearGradient(
                      end: Alignment.topRight,
                      begin: Alignment.bottomLeft,
                      colors: [
                        Theme.of(Get.context!).colorScheme.secondary,
                        Theme.of(Get.context!).colorScheme.onSecondary,
                      ],
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(2.px),
                    padding: EdgeInsets.all(8.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.px),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonMethods.textViewLinearGradient(
                            text: 'ABHI3025', value: true),
                        SizedBox(width: 8.px),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(
                                    const ClipboardData(text: 'ABHI3025'))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("copied to clipboard")));
                            });
                          },
                          child: CommonMethods.iconLinearGradient(
                              assetName: IconConstants.icCopy, value: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14.px),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.px),
                child: Image.asset(
                  ImgConstants.imgReferral,
                  height: 280.px,
                ),
              ),
              SizedBox(height: 14.px),
              Text(
                'Invite your friends to join crediplus and get ₦. 05.00 paytm cashback for each friend that joins using your referral code.',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 14.px),
              Text(
                'Your friend also gets ₦. 05.00 off on his crediplus membership.',
                textAlign: TextAlign.center,
                maxLines: 4,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnInviteNowButton(),
                child: Text(
                  StringConstants.inviteNow,
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
