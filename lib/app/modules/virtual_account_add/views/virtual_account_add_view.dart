import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/virtual_account_add_controller.dart';

class VirtualAccountAddView extends GetView<VirtualAccountAddController> {
  const VirtualAccountAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VirtualAccountAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VirtualAccountAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
