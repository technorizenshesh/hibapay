import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/withdraw_from_wallet_controller.dart';

class WithdrawFromWalletView extends GetView<WithdrawFromWalletController> {
  const WithdrawFromWalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WithdrawFromWalletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WithdrawFromWalletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
