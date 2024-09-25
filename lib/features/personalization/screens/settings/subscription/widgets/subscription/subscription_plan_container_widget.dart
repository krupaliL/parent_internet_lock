import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class PSubscriptionPlanContainerWidget extends StatelessWidget {
  const PSubscriptionPlanContainerWidget({
    super.key,
    required this.title,
    required this.members,
    required this.price,
    required this.isSelected
  });

  final String title, members, price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 63,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: PColors.primary) : Border.all(color: PColors.primary, width: 1.5),
        boxShadow: [
          isSelected ? BoxShadow(
            color: Colors.white.withOpacity(0.5), // Shadow color
            spreadRadius: 0.3, // Spread radius
            blurRadius: 1, // Blur radius
            offset: const Offset(0, 0), // Offset in x and y direction
          ) : BoxShadow(
            color: Colors.grey.withOpacity(0.4), // Shadow color
            spreadRadius: 1.5, // Spread radius
            blurRadius: 1, // Blur radius
            offset: const Offset(0, 0), // Offset in x and y direction
          ),
        ],
        color: isSelected ? PColors.primary : PColors.white,
      ),


      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: isSelected ? PColors.white : PColors.primary,
                    ),
                  ),
                  Text(
                    members,
                    style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      color: isSelected ? PColors.white : PColors.primary,
                    ),
                    // textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w500,
                        fontSize: 19.0,
                        color: isSelected ? PColors.white : PColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: 'month',
                      style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: isSelected ? PColors.white : PColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}