import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/term_conditions_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';

class TermAndConditionsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (termConditionsResult.isEmpty) {
      inAsyncCall.value = true;
    }
    await onInitWorking();
    inAsyncCall.value = false;
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

  clickOnLoadMoreButton() {}

  onInitWorking() async {
    await termConditionsApi();
  }

  termConditionsApi() async {
    TermConditionsModel? termConditionsModel =
        await ApiMethods.termConditions();
    if (termConditionsModel != null &&
        termConditionsModel.result != null &&
        termConditionsModel.result!.isNotEmpty) {
      termConditionsResult = termConditionsModel.result!;
      increment();
    }
  }
}
