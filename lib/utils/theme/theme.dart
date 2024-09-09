import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:parent_internet_lock/utils/theme/custom_themes/text_field_theme.dart';

class PAppTheme {
  PAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'LexendDeca',
    brightness: Brightness.light,
    primaryColor: PColors.primary,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme,
  );
}