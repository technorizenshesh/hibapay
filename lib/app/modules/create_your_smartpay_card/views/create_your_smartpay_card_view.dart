import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/create_your_smartpay_card_controller.dart';

class CreateYourSmartpayCardView
    extends GetView<CreateYourSmartpayCardController> {
  const CreateYourSmartpayCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 40.px),
              Text(
                StringConstants.createYourSmartPayCard,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 30.px, color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 14.px),
              Text(
                StringConstants.theCustomizable,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 40.px),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.px),
                child: Image.asset(
                  ImgConstants.imgCard,
                  height: 280.px,
                ),
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnGetFreeCardButton(),
                child: Text(
                  StringConstants.getFreeCard,
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
