import 'package:get/get.dart';

class RewardPointsController extends GetxController {
  final count = 0.obs;

  List listOfListTile = [
    'Points Ranking Milestones',
    'How To Earn Points',
    'Points Expiration Deadline',
  ];
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

  clickOnInviteFriendsFivePointsButton() {}
}
