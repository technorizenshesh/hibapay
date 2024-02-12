import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_methods.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.more),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px,vertical: 10.px),
        child: SingleChildScrollView(
          child: Wrap(
            children: List.generate(controller.list.length, (index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 3.4,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.px, vertical: 4.px),
                  child: InkWell(
                    onTap: () =>controller.clickOnCard(index: index),
                    borderRadius: BorderRadius.circular(8.px),
                    child: Container(
                      height: 100.px,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.px, vertical: 14.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.px),
                        border: Border.all(
                          width: .4.px,
                          color:
                              Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonMethods.appIconsPng(
                            assetName: controller.list[index]['icon'],
                            width: 24.px,
                            height: 24.px,
                          ),
                          SizedBox(height: 14.px),
                          Text(
                            controller.list[index]['title'],
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
