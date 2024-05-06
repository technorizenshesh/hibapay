import 'package:HibaPay/app/data/constants/icons_constant.dart';
import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(
            title: StringConstants.contactUs,
          ),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(20.px),
                child: Image.asset(
                  ImgConstants.imageContactUs,
                  height: 180.px,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.stillCantFindHelp,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.px,
                              ),
                    ),
                    SizedBox(height: 8.px),
                    Text(
                      StringConstants.youCanSendUs,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 12.px),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusEmail,
                      title: StringConstants.email,
                      controller: controller.emailController,
                      isCard: controller.isEmail.value,
                      prefixIcon: CommonMethods.appIcons(
                        assetName: controller.isEmail.value
                            ? IconConstants.icEmailActive
                            : IconConstants.icEmailInActive,
                      ),
                      hintText: StringConstants.pleaseEnterEmail,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusSelectIssue,
                      title: StringConstants.selectIssue,
                      controller: controller.cuqQuestionController,
                      isCard: controller.isSelectIssue.value,
                      hintText: StringConstants.selectIssue,
                      suffixIcon: CommonMethods.iconLinearGradient(
                          value: controller.isSelectIssue.value,
                          assetName: IconConstants.icDownArrow,
                          width: 10.px,
                          height: 10.px),
                      readOnly: true,
                      onTap: () => controller.clickOnSelectIssue(),
                    ),
                    SizedBox(height: 14.px),
                    Container(
                      decoration: BoxDecoration(
                        gradient: controller.isShareSomeMoreDetailsWithUs.value
                            ? CommonMethods.commonLinearGradientView()
                            : CommonMethods.commonLinearGradientViewGrey(),
                        borderRadius: BorderRadius.circular(14.px),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.4.px),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.px, horizontal: 16.px),
                        decoration: BoxDecoration(
                          color: Theme.of(Get.context!).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(14.px),
                        ),
                        child: TextField(
                          focusNode: controller.focusShareSomeMoreDetailsWithUs,
                          controller:
                              controller.shareSomeMoreDetailsWithUsController,
                          maxLines: 7,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(Get.context!).primaryColor),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                StringConstants.shareSomeMoreDetailsWithUs,
                            hintStyle:
                                Theme.of(Get.context!).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnSendMessageButton(),
                      child: Text(
                        StringConstants.sendMessage,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
