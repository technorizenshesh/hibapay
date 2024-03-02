import 'dart:async';

import 'package:get/get.dart';

class SpinnerController extends GetxController {
  final count = 0.obs;
  StreamController<int> selected = StreamController<int>();
  final items = <String>[
    '0',
    '1',
    '2',
    '0',
    '1',
    '2',
    '0',
    '1',
    '2',
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
}
