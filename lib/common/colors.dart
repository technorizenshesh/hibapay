import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;

  Color get onPrimary;

  Color get secondary;

  Color get onSecondary;

  Color get scaffoldBackgroundColor;

  Color get success;

  Color get error;

  Color get caption;

  Color get text;

  Color get onText;
}

class AppLightColors extends AppColors {
  @override
  Color get primary => const Color(0xff004A78);

  @override
  Color get onPrimary => const Color(0xffFFFFFF);

  @override
  Color get secondary => const Color(0xff407FF8);

  @override
  Color get onSecondary => const Color(0xff18EEC0);

  @override
  Color get caption => const Color(0xff9DB2BF);

  @override
  Color get error => const Color(0xffFF4D4C);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get text => const Color(0xff000000);

  @override
  // Color get success => const Color(0xff38E894);
  Color get success => const Color(0xff00A037);
}

class AppDarkColors extends AppColors {
  @override
  Color get primary => const Color(0xff004A78);

  @override
  Color get onPrimary => const Color(0xffFFFFFF);

  @override
  Color get secondary => const Color(0xff407FF8);

  @override
  Color get onSecondary => const Color(0xff18EEC0);

  @override
  Color get caption => const Color(0xff9DB2BF);

  @override
  Color get error => const Color(0xffFF4D4C);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get text => const Color(0xff000000);

  @override
  Color get success => const Color(0xff00A037);
}
