import 'package:HibaPay/common/globle.dart';
import 'package:HibaPay/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/faqs_controller.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(
            title: StringConstants.faqs,
          ),
          body: ListView.builder(
            itemCount: faqsResult.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.px),
                child: ListTile(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.px),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.surface,
                      width: .4.px,
                    ),
                  ),
                  subtitle: Text(
                    faqsResult[index].faqsAnswer ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12.px,
                        ),
                  ),
                  title: Text(
                    faqsResult[index].faqsQuestions ?? '',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px, color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
