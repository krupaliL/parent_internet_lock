import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:parent_internet_lock/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:parent_internet_lock/utils/theme/custom_themes/text_field_theme.dart';

class PAppTheme {
  PAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 12.0, color: PColors.primary);
        }
        return const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 12.0, color: PColors.black50);
      }),
    ),
    useMaterial3: true,
    fontFamily: 'LexendDeca',
    brightness: Brightness.light,
    primaryColor: PColors.primary,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme,
  );
}