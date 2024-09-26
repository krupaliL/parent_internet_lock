import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class PAlreadyPurchaseWidget extends StatelessWidget {
  const PAlreadyPurchaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already purchase? - ',
          style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 12.0, color: PColors.black32),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          child: const Text(
            'Restore',
            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 12.0, color: PColors.primary),
          ),
        ),
      ],
    );
  }
}