import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../../utils/constants/colors.dart';

class PSettingsMenuTile extends StatelessWidget {
  const PSettingsMenuTile({
    super.key,
    required this.prefixImage,
    required this.title,
    this.trailing,
    this.profileIcon = false,
    this.endIcon = true,
    this.onTap,
  });

  final String prefixImage;
  final String title;
  // final String subTitle;
  final Widget? trailing;
  final bool profileIcon;
  final bool endIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 5),
      // width: double.infinity,
      decoration: BoxDecoration(
        color: PColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 0.3, // Spread radius
            blurRadius: 0.5, // Blur radius
            offset: const Offset(0, 0), // Offset in x and y direction
          ),
        ],
      ),
      child: ListTile(
        leading: Image(height: 24, width: 24, image: AssetImage(prefixImage)),
        title: Text(
          title,
          style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 14.0, color: PColors.primary,),
        ),
        // subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
        // trailing: trailing,
        trailing: endIcon?
          profileIcon? Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
            ),
            child: const Image(image: AssetImage(PImages.penIcon)))
              : const Icon(Icons.chevron_right_sharp, size: 40, color: PColors.primary)
            : null,

        onTap: onTap,
      ),
    );
  }
}
