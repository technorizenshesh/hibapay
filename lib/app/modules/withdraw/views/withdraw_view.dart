import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.withdraw),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 40.px),
              ListTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.px),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: .4.px,
                  ),
                ),
                trailing: CommonMethods.appIcons(
                    assetName: IconConstants.icRightArrow),
                subtitle: Text(
                  '**** **** **** 1121',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                title: Text(
                  'Bank of America',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px, color: Theme.of(context).primaryColor),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24.px),
                  child: Image.asset(
                    'assets/images/img_logo.png',
                    height: 48.px,
                    width: 48.px,
                  ),
                ),
              ),
              SizedBox(height: 40.px),
              Text(
                '${CommonMethods.cur} 8,256',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 40.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 10.px),
              Text(
                'Maximum ${CommonMethods.cur} 12,652.00',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 12.px,
                    ),
              ),
              SizedBox(height: 40.px),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '50%',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '75%',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: CommonMethods.commonLinearGradientView(),
                          borderRadius: BorderRadius.circular(12.px),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.px,
                            horizontal: 20.px,
                          ),
                          child: Text(
                            '100%',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.px),
              /*SizedBox(
                height: 40.px,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listOfData.length,
                  itemBuilder: (context, index) {
                    return controller.selectedValue.value == index
                        ? Container(
                            decoration: BoxDecoration(
                              gradient:
                                  CommonMethods.commonLinearGradientView(),
                              borderRadius: BorderRadius.circular(12.px),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.px,
                                horizontal: 20.px,
                              ),
                              child: Text(
                                controller.listOfData[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              controller.listOfData[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          );
                  },
                ),
              ),
              SizedBox(height: 40.px),*/
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnWithdrawButton(),
                child: Text(
                  StringConstants.withdraw,
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
