import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/pay_summary_controller.dart';

class PaySummaryView extends GetView<PaySummaryController> {
  const PaySummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.payment),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 40.px),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.px),
                  child: Image.asset(
                    ImgConstants.imgSplash,
                    height: 85.px,
                  ),
                ),
                SizedBox(height: 40.px),
                Text(
                  StringConstants
                      .youHaveChosenToMakeTheFollowingBillPaymentPleaseConfirmToProceed,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 40.px),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.parameters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.px),
                      child: gradientText(
                        title:
                            controller.parameters.entries.elementAt(index).key,
                        subTitle: controller.parameters.entries
                            .elementAt(index)
                            .value
                            .toString(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnPayButton(),
                  child: Text(
                    StringConstants.pay,
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
        ),
      );
    });
  }

  gradientText({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonMethods.textViewLinearGradient(
              text: title,
            ),
          ],
        ),
        SizedBox(height: 4.px),
        Row(
          children: [
            if (title == StringConstants.amount ||
                title == StringConstants.fee ||
                title == StringConstants.total)
              CommonMethods.appIcons(
                assetName: IconConstants.icCur,
                width: 14.px,
                height: 14.px,
                color: Theme.of(Get.context!).textTheme.displayMedium?.color,
              ),
            Flexible(
              child: Text(
                subTitle,
                maxLines: 3,
                style: Theme.of(Get.context!)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
