import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/personalization/controller/subscription_plan_controller.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/subscription_plan.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/widgets/subscription/already_purchase_widget.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/widgets/subscription/benefits_premium_subtitle_widget.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/widgets/subscription/free_trial_elevated_button_widget.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/widgets/subscription/subscription_plan_container_widget.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/terms_and_privacy.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final SubscriptionPlanController controller = Get.put(SubscriptionPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
      appBar: PAppBar(
        leadingIcon: Icons.close_sharp,
        leadingOnPressed: () => Get.back(),
        title: const Text(
          'Subscription',
          style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Subscription Image
                    const Image(image: AssetImage(PImages.subscription)),
                    const SizedBox(height: 20),

                    /// Benefits
                    const Text(
                      PTexts.benefitsOfPremium,
                      style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 16.0, color: PColors.primary),
                      // textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),

                    /// Benefits SubTitle
                    const Column(
                      children: [
                        PBenefitsPremiumSubtitleWidget(subTitle: PTexts.benefitsOfPremiumSubTitle1),
                        SizedBox(height: 10),
                        PBenefitsPremiumSubtitleWidget(subTitle: PTexts.benefitsOfPremiumSubTitle2),
                        SizedBox(height: 10),
                        PBenefitsPremiumSubtitleWidget(subTitle: PTexts.benefitsOfPremiumSubTitle3),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// Subscription Plans
                    GestureDetector(
                      onTap: () {
                        controller.updateSelectedPlan(PTexts.basic);
                        Get.to(const SubscriptionPlanScreen(members: PTexts.member2, dollars: PTexts.dollar1,));
                      },
                      child: Obx(() => PSubscriptionPlanContainerWidget(
                        title: PTexts.basic,
                        members: PTexts.member2,
                        price: PTexts.dollar1,
                        isSelected: controller.selectedPlan.value == PTexts.basic,
                      )),
                    ),
                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        controller.updateSelectedPlan(PTexts.plus);
                        Get.to(const SubscriptionPlanScreen(members: PTexts.member5, dollars: PTexts.dollar2,));
                      },
                      child: Obx(() => PSubscriptionPlanContainerWidget(
                        title: PTexts.plus,
                        members: PTexts.member5,
                        price: PTexts.dollar2,
                        isSelected: controller.selectedPlan.value == PTexts.plus,
                      )),
                    ),
                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        controller.updateSelectedPlan(PTexts.gold);
                        Get.to(const SubscriptionPlanScreen(members: PTexts.member10, dollars: PTexts.dollar3,));
                      },
                      child: Obx(() => PSubscriptionPlanContainerWidget(
                        title: PTexts.gold,
                        members: PTexts.member10,
                        price: PTexts.dollar3,
                        isSelected: controller.selectedPlan.value == PTexts.gold,
                      )),
                    ),
                  ],
                ),
              ),
            ),

            const Column(
              children: [
                SizedBox(height: 10),

                /// Terms and Privacy
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PTermsAndPrivacyWidget(),
                  ],
                ),
                SizedBox(height: 10),

                /// Free Trial Button
                PFreeTrialElevatedButtonWidget(),

                /// Restore Purchased Subscription
                PAlreadyPurchaseWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}