import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reward_points_controller.dart';

class RewardPointsView extends GetView<RewardPointsController> {
  const RewardPointsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RewardPointsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RewardPointsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
