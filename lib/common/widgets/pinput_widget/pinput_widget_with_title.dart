import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/constants/colors.dart';

class PPinputWidgetWithTitle extends StatelessWidget {
  const PPinputWidgetWithTitle({
    super.key,
    required this.title,
    this.length = 4,
  });

  final String title;
  final int length;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 41,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      textStyle: const TextStyle(
        fontFamily: 'LexendDeca',
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        color: PColors.white,
      ),
      decoration: BoxDecoration(
        // color: PColors.primary,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: PColors.primary),
      ),
    );

    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 14.0, color: PColors.blackPIN),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14.0),
        Pinput(
          length: length,
          defaultPinTheme: defaultPinTheme,
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: Colors.transparent),
              color: PColors.primary,
            ),
          ),
          onCompleted: (pin) => debugPrint(pin),
        ),
      ],
    );
  }
}