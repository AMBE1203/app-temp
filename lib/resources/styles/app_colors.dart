import 'package:flutter/material.dart';

import '../resources.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.errorTextColor,
    required this.primaryGradient,
    required this.border,
    required this.borderInput,
    required this.disabled,
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color errorTextColor;
  final Color border;
  final Color borderInput;
  final Color disabled;

  /// gradient
  final LinearGradient primaryGradient;

  static const defaultAppColor = AppColors(
    primaryColor: Color.fromARGB(255, 48, 112, 248),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryTextColor: Color.fromARGB(255, 62, 62, 70),
    secondaryTextColor: Color.fromARGB(255, 255, 255, 255),
    errorTextColor: Color(0xffCD3632),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
    border: Color(0xffBEBEBE),
    borderInput: Color(0xff333333),
    disabled: Color(0x80000548),
  );

  static const darkThemeColor = AppColors(
    primaryColor: Color.fromARGB(255, 62, 62, 70),
    secondaryColor: Color.fromARGB(255, 166, 168, 254),
    primaryTextColor: Color.fromARGB(255, 166, 168, 254),
    secondaryTextColor: Color.fromARGB(255, 62, 62, 70),
    errorTextColor: Color(0xffCD3632),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
    border: Color(0xffDCDCDC),
    borderInput: Color(0xffDCDCDC),
    disabled: Color(0x80000548),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;
    current = appColor;
    return current;
  }

  AppColors copyWith({
    LinearGradient? primaryGradient,
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? errorTextColor,
    Color? border,
    Color? borderInput,
    Color? disabled,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      border: border ?? this.border,
      borderInput: borderInput ?? this.borderInput,
      disabled: disabled ?? this.disabled,
    );
  }
}
