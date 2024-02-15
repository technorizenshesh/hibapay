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
    return Scaffold(
      appBar: CommonWidgets.appBar(
        title: StringConstants.payNow,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.px),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'You have any question ?',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 14.px, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 14.px),
          TextField(
            controller: controller.searchController,
            decoration: CommonWidgets.inputDecoration(
              hintText: StringConstants.searchContacts,
            ),
          ),
          SizedBox(height: 14.px),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Frequently Asked',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
              Text(
                'View All',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
            ],
          ),
          SizedBox(height: 14.px),
          ListTile(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.px),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: .4.px,
              ),
            ),
            subtitle: Text(
              'You can create a Smartpay account by: download and\nopen the smartpay application first then select ...',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                  ),
            ),
            title: Text(
              'How do I create a Smartpay account?',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 14.px),
          ListTile(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.px),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: .4.px,
              ),
            ),
            subtitle: Text(
              'You can select the create card menu then select Add New Card" select the continue button then you ...',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                  ),
            ),
            title: Text(
              'How to create a card for Smartpay?',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 14.px),
          ListTile(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.px),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: .4.px,
              ),
            ),
            subtitle: Text(
              'Click the Top Up menu then select the amount of money and the method then click the "top up now" button...',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                  ),
            ),
            title: Text(
              'How to Top Up on Smartpay??',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonElevatedButton(
            onPressed: () => controller.clickOnLoadMoreButton(),
            child: Text(
              StringConstants.loadMore,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ]),
      ),
    );
  }
}
