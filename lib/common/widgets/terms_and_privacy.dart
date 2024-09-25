import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class PTermsAndPrivacyWidget extends StatelessWidget {
  const PTermsAndPrivacyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: const TextStyle(
              fontFamily: 'LexendDeca',
              fontWeight: FontWeight.w600
              , fontSize: 14.0,
              color: PColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: PColors.primary,
              decorationThickness: 2,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {},
          ),
          const TextSpan(
            text: '  and  ',
            style: TextStyle(
              fontFamily: 'LexendDeca',
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
              color: PColors.black50,),
          ),
          TextSpan(
            text: 'Privacy policy',
            style: const TextStyle(
              fontFamily: 'LexendDeca',
              fontWeight: FontWeight.w600
              , fontSize: 14.0,
              color: PColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: PColors.primary,
              decorationThickness: 2,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {},
          ),
        ],
      ),
    );
  }
}