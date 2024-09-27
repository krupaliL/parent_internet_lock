import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/text_strings.dart';

class PFreeTrialElevatedButtonWidget extends StatelessWidget {
  const PFreeTrialElevatedButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: PColors.grey.withOpacity(0.7),
            spreadRadius: 0.3,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            child: const Column(
              children: [
                Text(
                  PTexts.freeTrial,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0, color: Colors.white),
                ),
                Text(
                  PTexts.freeTrial7Days,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0, color: Colors.white),
                ),
              ],
            )
        ),
      ),
    );
  }
}