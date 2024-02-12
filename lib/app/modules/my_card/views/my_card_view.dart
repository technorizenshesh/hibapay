import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hibapay/app/data/constants/string_constants.dart';
import 'package:hibapay/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/my_card_controller.dart';

class MyCardView extends GetView<MyCardController> {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.myCard,wantBackButton: false),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listOfCard.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.px, vertical: 10.px),
                child: Image.asset(
                  controller.listOfCard[index],
                ),
              );
            },
          ),
          SizedBox(height: 24.px),
          Center(
            child: InkWell(
              onTap: ()=>controller.clickOnAddNewCard(),
              borderRadius: BorderRadius.circular(20.px),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.px),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(.4.px),
                    width: .4.px,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Text(
                    "+   ${StringConstants.addNewCard}",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.px),
        ],
      ),
    );
  }
}
