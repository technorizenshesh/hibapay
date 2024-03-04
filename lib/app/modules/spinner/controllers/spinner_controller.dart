import 'dart:async';

import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class SpinnerController extends GetxController {
  final coins = "0".obs;
  final count = 0.obs;
  StreamController<int> selected = StreamController<int>();
  final items = <String>[
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
    '110',
    '120',
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

  clickOnSpinToAgainButton() {
    selected.add(
      Fortune.randomInt(0, items.length),
    );
    increment();
  }

  onFocusItemChanged({required int value}) {
    coins.value = items[value].toString();
    increment();
  }
}
