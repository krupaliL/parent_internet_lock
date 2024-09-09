import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

class PTextFormFieldTheme {
  PTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    // labelStyle: const TextStyle().copyWith(fontSize: 13, color: PColors.primary),
    // hintStyle: const TextStyle().copyWith(fontSize: 14, color: PColors.primary),
    errorStyle: const TextStyle().copyWith(fontSize: 13, color: PColors.error),
    // floatingLabelStyle: const TextStyle().copyWith(color: PColors.primary.withOpacity(0.8)),
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );
}