import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextThemeStyle {
  static TextStyle displaySmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 57.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle displayMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 32.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w800,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle displayLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 24.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineSmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 24.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleSmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 10.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodySmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelSmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 12.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }
}

class AppTextTheme {
  TextTheme myTextTheme({String? fontFamily, dynamic colors}) {
    String semiBold = "${fontFamily}SemiBold";
    String regular = "${fontFamily}Regular";
    String light = "${fontFamily}Light";
    String bold = "${fontFamily}Bold";
    return TextTheme(
      displaySmall: AppTextThemeStyle.displaySmall(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      displayMedium: AppTextThemeStyle.displayMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      displayLarge: AppTextThemeStyle.displayLarge(
        color: colors.text,
        fontFamily: bold,
      ),
      headlineSmall: AppTextThemeStyle.headlineSmall(
        color: colors.onText,
        fontFamily: fontFamily,
      ),
      headlineMedium: AppTextThemeStyle.headlineMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      headlineLarge: AppTextThemeStyle.headlineLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      titleSmall: AppTextThemeStyle.titleSmall(
        color: colors.caption,
        fontFamily: fontFamily,
      ),
      titleMedium: AppTextThemeStyle.titleMedium(
        color: colors.caption,
        fontFamily: fontFamily,
      ),
      titleLarge: AppTextThemeStyle.titleLarge(
        color: colors.caption,
        fontFamily: fontFamily,
      ),
      bodySmall: AppTextThemeStyle.bodySmall(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      bodyMedium: AppTextThemeStyle.bodyMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      bodyLarge: AppTextThemeStyle.bodyLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      labelSmall: AppTextThemeStyle.labelSmall(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      labelMedium: AppTextThemeStyle.labelMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      labelLarge: AppTextThemeStyle.labelLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
    );
  }
}
