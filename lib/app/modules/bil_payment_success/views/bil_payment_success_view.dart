import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import '../controllers/bil_payment_success_controller.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class BilPaymentSuccessView extends GetView<BilPaymentSuccessController> {
  const BilPaymentSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.bilPayment),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
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
              gradientText(
                  title: StringConstants.meterNumber,
                  subTitle: '****************'),
              SizedBox(height: 14.px),
              gradientText(
                  title: StringConstants.serviceProvider,
                  subTitle: 'Adani Electricity Mumbai Limited'),
              SizedBox(height: 14.px),
              gradientText(
                  title: StringConstants.amount,
                  subTitle: '${CommonMethods.cur} 225.00'),
              SizedBox(height: 14.px),
              gradientText(
                  title: StringConstants.accountNumber,
                  subTitle: '**** **** **** ****'),
              SizedBox(height: 14.px),
              gradientText(title: StringConstants.nickName, subTitle: 'Sahil'),
              SizedBox(height: 14.px),
              gradientText(
                  title: StringConstants.remarks, subTitle: '****************'),
              SizedBox(height: 14.px),
              InkWell(
                borderRadius: BorderRadius.circular(8.px),
                onTap: () => controller.clickOnDownloadReceipt(),
                child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        StringConstants.downloadReceipt,
                        maxLines: 2,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 14.px,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                              decorationThickness: 2.px,
                            ),
                      ),
                      SizedBox(width: 6.px),
                      CommonMethods.appIconsPng(
                        assetName: IconConstantsPng.icDownloadReceipt,
                        width: 20.px,
                        height: 20.px,
                      )
                    ],
                  ),
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
        Text(
          subTitle,
          maxLines: 2,
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 14.px),
        ),
      ],
    );
  }
}
