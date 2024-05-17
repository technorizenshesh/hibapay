import 'package:HibaPay/app/data/apis/api_constants/api_key_constants.dart';
import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_live_transaction_details_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaySummarySuccessController extends GetxController {
  final count = 0.obs;
  Map<String, String?> arguments = Get.arguments;
  Map<String, String?> parameters = Get.parameters;

  final reference = ''.obs;
  final serviceType = ''.obs;
  final authTokenHiba = ''.obs;
  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    authTokenHiba.value = sp.getString(ApiKeyConstants.authTokenHiba) ?? '';
    reference.value = parameters[ApiKeyConstants.reference] ?? '';
    serviceType.value = parameters[ApiKeyConstants.serviceType] ?? '';
    super.onInit();
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

  clickOnBackToHomeButton() {
    Get.back();
  }

  clickOnGenerateTokenButton() async {
    await getLiveTransactionDetailsApi();
  }

  getLiveTransactionDetailsApi() async {
    inAsyncCall.value = true;
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.authTokenHiba: authTokenHiba.value,
      ApiKeyConstants.reference: reference.value,
    };
    GetLiveTransactionDetailsModel? getLiveTransactionDetailsModel =
        await ApiMethods.getLiveTransactionDetails(bodyParams: bodyParams);
    if (getLiveTransactionDetailsModel != null &&
        getLiveTransactionDetailsModel.result != null &&
        getLiveTransactionDetailsModel.result!.data != null) {
      increment();
    }
    inAsyncCall.value = false;
  }
}
