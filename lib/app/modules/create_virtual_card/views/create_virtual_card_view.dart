import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/common_methods.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/create_virtual_card_controller.dart';

class CreateVirtualCardView extends GetView<CreateVirtualCardController> {
  const CreateVirtualCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonMethods.unFocsKeyBoard(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.createVirtualCard),
        body: Obx(() {
          controller.count.value;
          return ProgressBar(
            inAsyncCall: controller.inAsyncCall.value,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusName,
                        title: StringConstants.name,
                        controller: controller.nameController,
                        isCard: controller.isName.value,
                        hintText: StringConstants.pleaseEnterName,
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        readOnly: true,
                        onTap: () => controller.clickOnPickColorField(),
                        focusNode: controller.focusColor,
                        title: StringConstants.colorText,
                        controller: controller.colorController,
                        isCard: controller.isColor.value,
                        hintText: StringConstants.pleaseEnterColor,
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          Text(
                            StringConstants.selectedColor,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          SizedBox(width: 10.px),
                          Container(
                            height: 24.px,
                            width: 24.px,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12.px),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1.px),
                              child: Container(
                                height: 20.px,
                                width: 20.px,
                                decoration: BoxDecoration(
                                  color: controller.currentColor,
                                  borderRadius: BorderRadius.circular(10.px),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnCreateButton(),
                        child: Text(
                          StringConstants.create,
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
