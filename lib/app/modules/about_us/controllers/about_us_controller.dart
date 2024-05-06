import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/about_us.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';

class AboutUsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (aboutUsResult.isEmpty) {
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
    await aboutUsApi();
  }

  aboutUsApi() async {
    AboutUsModel? aboutUsModel = await ApiMethods.aboutUs();
    if (aboutUsModel != null &&
        aboutUsModel.result != null &&
        aboutUsModel.result!.isNotEmpty) {
      aboutUsResult = aboutUsModel.result!;
      increment();
    }
  }
}
