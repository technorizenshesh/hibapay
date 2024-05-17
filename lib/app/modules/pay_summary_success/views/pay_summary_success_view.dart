import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/pay_summary_success_controller.dart';

class PaySummarySuccessView extends GetView<PaySummarySuccessController> {
  const PaySummarySuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.paymentSuccess),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(height: 40.px),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.px),
                child: Image.asset(
                  ImgConstants.imgSuccess,
                  height: 100.px,
                  width: 100.px,
                ),
              ),
              SizedBox(height: 14.px),
              Text(
                StringConstants.success,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 24.px),
              ),
              SizedBox(height: 40.px),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.arguments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10.px),
                    child: gradientText(
                      title: controller.arguments.entries.elementAt(index).key,
                      subTitle: controller.arguments.entries
                          .elementAt(index)
                          .value
                          .toString(),
                    ),
                  );
                },
              ),
              SizedBox(height: 40.px),
              if (controller.reference.value.isNotEmpty)
                if (controller.serviceType.value ==
                        ApiKeyConstants.buyEducation ||
                    controller.serviceType.value ==
                        ApiKeyConstants.buyElectricity)
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnGenerateTokenButton(),
                    child: Text(
                      StringConstants.generateToken,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
              if (controller.reference.value.isNotEmpty)
                if (controller.serviceType.value ==
                        ApiKeyConstants.buyEducation ||
                    controller.serviceType.value ==
                        ApiKeyConstants.buyElectricity)
                  SizedBox(height: 20.px),
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
