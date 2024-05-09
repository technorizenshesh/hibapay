import 'package:HibaPay/app/data/constants/image_constants.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/app/modules/term_and_conditions/controllers/term_and_conditions_controller.dart';
import 'package:HibaPay/common/common_widgets.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermAndConditionsView extends GetView<TermAndConditionsController> {
  const TermAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.termConditions),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(20.px),
                child: Image.asset(
                  ImgConstants.imageAboutsUs,
                  height: 180.px,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.termConditionsResult.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.termConditionsResult[index].name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 20.px,
                              ),
                        ),
                        SizedBox(height: 8.px),
                        Html(
                            data: controller
                                    .termConditionsResult[index].description ??
                                ''),
                        /*Text(
                          parse(controller.termConditionsResult[index].description ?? '')
                              .outerHtml,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 12.px),
                        ),*/
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
