import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_preferences_controller.dart';

class ContactPreferencesView extends GetView<ContactPreferencesController> {
  const ContactPreferencesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactPreferencesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContactPreferencesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
