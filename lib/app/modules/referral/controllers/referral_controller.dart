import 'package:HibaPay/common/globle.dart';
import 'package:get/get.dart';
import 'package:social_share/social_share.dart';

class ReferralController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
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

  clickOnInviteNowButton() {
    SocialShare.shareOptions(
      "Hey there! Heard of HibaPay? It's a game-changer for payments! Fast, secure, and seamless. Use my code HB${result?.referralUserId ?? ''} when you sign up and let's both enjoy the perks! 🎉💳 #HibaPayRevolution",
    );
  }
}
