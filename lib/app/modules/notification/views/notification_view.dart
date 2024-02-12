import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/common/common_widgets.dart';
import '../controllers/notification_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../data/constants/string_constants.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.notification),
        body: ListView(
          children: [
            Column(children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Today, Mar 20',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 14.px),
                        maxLines: 1,
                      ),
                    ),
                    /*Text(
                      StringConstants.allTransactions,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Theme.of(context).primaryColor),
                    ),*/
                  ],
                ),
              ),
              SizedBox(height: 10.px),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.listOfTra.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Text(
                      controller.listOfTra[index]['time'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 14.px,
                          ),
                    ),
                    subtitle: Text(
                      controller.listOfTra[index]['sub_title'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.px,
                          ),
                    ),
                    title: Text(
                      controller.listOfTra[index]['title'],
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 14.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    leading: CommonMethods.appIcons(
                        assetName: controller.listOfTra[index]['icon']),
                  );
                },
              ),
            ]),
          ],
        ),
      );
    });
  }
}
