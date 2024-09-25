import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

class PSubscriptionPlanWidget extends StatelessWidget {
  const PSubscriptionPlanWidget({
    super.key,
    required this.title,
    required this.text,
    this.dollars = '',
    this.isMember = true,
  });

  final String title, text, dollars;
  final bool isMember;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        /// Title of Container
        Text(
          title,
          style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 14.0, color: PColors.primary),
        ),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: PColors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 0.3, // Spread radius
                blurRadius: 1, // Blur radius
                offset: const Offset(0, 0), // Offset in x and y direction
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 12),

              /// Plan Details
              Text(
                text,
                style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.black),
              ),
              // const SizedBox(width: 12),
              const Spacer(),
              if (isMember)  RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: dollars,
                      style: const TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        color: PColors.primary,
                      ),
                    ),
                    const TextSpan(
                      text: 'month',
                      style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                        color: PColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}