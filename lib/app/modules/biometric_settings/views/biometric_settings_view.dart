import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:hibapay/common/switch_button_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/biometric_settings_controller.dart';

class BiometricSettingsView extends GetView<BiometricSettingsController> {
  const BiometricSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CommonWidgets.appBar(title: StringConstants.biometricSettings),
        body: ListView.builder(
          itemCount: controller.listOfListTileTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => controller.clickOnListTile(index: index),
              title: Text(
                controller.listOfListTileTitles[index]['title'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                  controller.listOfListTileTitles[index]['sub_title'],
                  style: Theme.of(context).textTheme.titleSmall),
              trailing: index == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSwitch(
                          value:
                              index == 0 ? controller.switchValue.value : false,
                          onChanged: (value) {
                            if (index == 0) {
                              controller.switchValue.value =
                                  !controller.switchValue.value;
                              controller.increment();
                            }
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    )
                  : null,
            );
          },
        ),
      );
    });
  }
}
