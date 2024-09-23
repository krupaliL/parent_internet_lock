import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';

class PHomeAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const PHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PAppBar(
      title: const Text(
        'Home',
        style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.black),
        // textAlign: TextAlign.center,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            // color: Colors.blue[100],
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: PColors.primary, width: 1.0),
          ),
          child: const Text(
            '1:30 Second',
            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}