import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class PElevatedButtonWidget extends StatelessWidget {
  const PElevatedButtonWidget({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: PColors.grey.withOpacity(0.7), // Shadow color
            spreadRadius: 0.3, // Spread radius
            blurRadius: 4, // Blur radius
            offset: Offset(0, 0), // Offset in x and y direction
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(title),
        ),
      ),
    );
  }
}