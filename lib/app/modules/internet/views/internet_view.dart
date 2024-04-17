import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/internet_controller.dart';

class InternetView extends GetView<InternetController> {
  const InternetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InternetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InternetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
