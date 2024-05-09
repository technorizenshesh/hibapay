import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/contact_us_questions_model.dart';
import 'package:HibaPay/app/data/apis/api_models/user_model.dart';
import 'package:HibaPay/app/data/constants/string_constants.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  FocusNode focusEmail = FocusNode();
  FocusNode focusSelectIssue = FocusNode();
  FocusNode focusShareSomeMoreDetailsWithUs = FocusNode();

  final isEmail = false.obs;
  final isSelectIssue = false.obs;
  final isShareSomeMoreDetailsWithUs = false.obs;

  final authTokenHiba = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController cuqQuestionController = TextEditingController();
  TextEditingController shareSomeMoreDetailsWithUsController =
      TextEditingController();
  final cuqId = ''.obs;
  final cuqQuestion = ''.obs;

  Map<String, dynamic> bodyParams = {};
  List<ContactUsQuestionsResult> contactUsQuestionsResult = [];


  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    super.onInit();
    startListener();
    /*if (contactUsQuestionsResult.isEmpty) {
    }*/
    inAsyncCall.value = true;
    await onInitWorking();
    inAsyncCall.value = false;
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusSelectIssue.addListener(onFocusChange);
    focusShareSomeMoreDetailsWithUs.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isSelectIssue.value = focusSelectIssue.hasFocus;
    isShareSomeMoreDetailsWithUs.value =
        focusShareSomeMoreDetailsWithUs.hasFocus;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  onInitWorking() async {
    await contactUsQuestionsApi();
  }

  contactUsQuestionsApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value
    };
    ContactUsQuestionsModel? contactUsQuestionsModel =
        await ApiMethods.contactUsQuestions(bodyParams: bodyParams);
    if (contactUsQuestionsModel != null &&
        contactUsQuestionsModel.result != null &&
        contactUsQuestionsModel.result!.isNotEmpty) {
      contactUsQuestionsResult = contactUsQuestionsModel.result!;
      increment();
    }
  }

  clickOnSendMessageButton() async {
    if (emailController.text.trim().isNotEmpty &&
        cuqQuestionController.text.trim().isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.cuqImage: '',
        ApiKeyConstants.cuqEmail: emailController.text,
        ApiKeyConstants.cuqMessage: shareSomeMoreDetailsWithUsController.text,
        ApiKeyConstants.cuqId: cuqId.value,
        ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      };
      inAsyncCall.value = true;
      UserModel? userModel = await ApiMethods.contactUs(bodyParams: bodyParams);
      if (userModel != null) {
        if (userModel.message != null && userModel.message!.isNotEmpty) {
          Get.back();
          Get.snackbar(
              margin: EdgeInsets.all(20.px),
              'Message',
              userModel.message ?? '');
        } else {
          Get.snackbar(
              margin: EdgeInsets.all(20.px), 'Error', 'Something went wrong');
        }
      }
      inAsyncCall.value = false;
    } else {
      Get.snackbar(
          margin: EdgeInsets.all(20.px), 'Error', 'All field required');
    }
  }

  clickOnSelectIssue() {
    Get.bottomSheet(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Text(
                StringConstants.selectIssue,
                style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(Get.context!).primaryColor,
                    ),
              ),
              SizedBox(height: 14.px),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Obx(() {
                    count.value;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.px),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Theme.of(Get.context!)
                              .colorScheme
                              .surface, // Set the inactive color here
                        ),
                        child: RadioListTile(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.px),
                            borderSide: BorderSide(
                              color: Theme.of(Get.context!).colorScheme.surface,
                              width: .4.px,
                            ),
                          ),
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            cuqQuestion.value =
                                contactUsQuestionsResult[index].cuqQuestion ??
                                    '';
                            cuqQuestionController.text = cuqQuestion.value;
                            cuqId.value =
                                contactUsQuestionsResult[index].cuqId ?? '';
                            increment();
                            print('cuqQuestion.value:::${cuqQuestion.value}');
                            Get.back();
                          },
                          title: Text(
                            contactUsQuestionsResult[index].cuqQuestion ?? '',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          value: cuqQuestion.value,
                          groupValue:
                              contactUsQuestionsResult[index].cuqQuestion ?? '',
                        ),
                      ),
                    );
                  });
                },
                itemCount: contactUsQuestionsResult.length,
              ),
              SizedBox(height: 14.px),
            ],
          ),
        ),
      ),
    );
  }
}
