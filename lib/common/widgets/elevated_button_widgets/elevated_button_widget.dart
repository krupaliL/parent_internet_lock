import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class PElevatedButtonWidget extends StatelessWidget {
  const PElevatedButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

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
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}