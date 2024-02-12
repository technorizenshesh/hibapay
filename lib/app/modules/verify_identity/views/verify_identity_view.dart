import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/icons_constant.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/verify_identity_controller.dart';

class VerifyIdentityView extends GetView<VerifyIdentityController> {
  const VerifyIdentityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CommonWidgets.appBar(title: StringConstants.verifyIdentity),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                        Theme.of(Get.context!)
                            .colorScheme
                            .secondary
                            .withOpacity(.1.px),
                        Theme.of(Get.context!)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.1.px),
                      ],
                    )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.px, vertical: 40.px),
                  child: Column(
                    children: [
                      Text(
                        StringConstants.governmentId,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 24.px),
                      ),
                      SizedBox(height: 14.px),
                      Text(
                        StringConstants.takeADriversLicense,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 30.px),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonMethods.appIconsPng(
                            assetName: IconConstantsPng.icAddIdentity,
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            StringConstants.select,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.px),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.px),
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [
                        Theme.of(Get.context!)
                            .colorScheme
                            .secondary
                            .withOpacity(.1.px),
                        Theme.of(Get.context!)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.1.px),
                      ],
                    )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.px, vertical: 40.px),
                  child: Column(
                    children: [
                      Text(
                        StringConstants.selfiePhoto,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 24.px),
                      ),
                      SizedBox(height: 14.px),
                      Text(
                        StringConstants.itsRequiredByLaw,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 30.px),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonMethods.appIconsPng(
                            assetName: IconConstantsPng.icAddIdentity,
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            StringConstants.select,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnVerifyMyIdentityButton(),
                child: Text(
                  StringConstants.verifyMyIdentity,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }
}
