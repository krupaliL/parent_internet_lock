import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/subscription.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/widgets/subscription_plan/subscription_plan_widget.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  const SubscriptionPlanScreen({
    super.key, required this.members, required this.dollars,
  });

  final String members, dollars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
      appBar: const PAppBar(
        showBackArrow: true,
        title: Text(
          'Subscription plan',
          style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.black),
        ),
      ),

      body: Padding(
        padding: PSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// Subscription Image
            const Image(image: AssetImage(PImages.subscription)),
            const SizedBox(height: 10),

            /// Details
            PSubscriptionPlanWidget(
              title: PTexts.currentSubscription,
              text: members,
              dollars: dollars,
            ),
            const PSubscriptionPlanWidget(
              title: PTexts.expireOn,
              text: '25/09/2024',
              isMember: false,
            ),
            const Spacer(),

            /// Cancel Subscription Button
            PElevatedButtonWidget(onPressed: () => Get.to(() => SubscriptionScreen()), title: PTexts.cancelSubscription),
          ],
        ),
      ),
    );
  }
}
