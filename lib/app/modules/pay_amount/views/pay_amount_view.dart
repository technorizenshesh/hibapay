import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pay_amount_controller.dart';

class PayAmountView extends GetView<PayAmountController> {
  const PayAmountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayAmountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PayAmountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
