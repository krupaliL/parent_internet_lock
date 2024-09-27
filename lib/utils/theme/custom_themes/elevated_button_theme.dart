import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

/// -- Elevated Button Themes
class PElevatedButtonTheme {
  PElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: PColors.white,
      backgroundColor: PColors.primary,
      disabledForegroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, fontFamily: 'LexendDeca', fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}