import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

/// -- Outline Button Themes
class POutlinedButtonTheme {
  POutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: PColors.outlinedForeground,
      disabledForegroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: PColors.outlinedBorder),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 16, fontFamily: 'LexendDeca', fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
/*

    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: TColors.grey),
      textStyle: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
*/

  );
}