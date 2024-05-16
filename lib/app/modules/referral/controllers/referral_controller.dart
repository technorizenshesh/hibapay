import 'package:HibaPay/app/data/apis/api_methods/api_methods.dart';
import 'package:HibaPay/app/data/apis/api_models/get_referral_description_model.dart';
import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:social_share/social_share.dart';

class ReferralController extends GetxController {
  final count = 0.obs;

  List<GetReferralDescriptionResult> getReferralDescriptionResult = [];

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
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

  clickOnInviteNowButton() {
    SocialShare.shareOptions(
      "${getReferralDescriptionResult.first.refDesLinkMessage} HB${result?.id ?? ''}",
    );
  }

  onInitWorking() async {
    await getReferralDescriptionApi();
  }

  getReferralDescriptionApi() async {
    GetReferralDescriptionModel? getReferralDescriptionModel =
        await ApiMethods.getReferralDescription();
    if (getReferralDescriptionModel != null &&
        getReferralDescriptionModel.result != null &&
        getReferralDescriptionModel.result!.isNotEmpty) {
      getReferralDescriptionResult = getReferralDescriptionModel.result!;
      increment();
    }
  }
}
