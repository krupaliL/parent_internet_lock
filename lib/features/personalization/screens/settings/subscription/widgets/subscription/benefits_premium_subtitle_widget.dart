import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class PBenefitsPremiumSubtitleWidget extends StatelessWidget {
  const PBenefitsPremiumSubtitleWidget({
    super.key, required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: PColors.primary,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            subTitle,
            style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 11.0, color: PColors.black50),
            maxLines: 1,
          ),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}