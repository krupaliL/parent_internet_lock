import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/subscription/subscription.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/widgets/settings_manu_tile.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/terms_and_privacy.dart';
import '../../../../utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
        appBar: const PAppBar(
          title: Text(
            'Settings',
            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.black),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              /// Setting Tiles
              const PSettingsMenuTile(
                prefixImage: PImages.userIcon,
                title: 'Profile Name',
                profileIcon: true,
              ),
              const SizedBox(height: 10),

              const PSettingsMenuTile(
                prefixImage: PImages.keyIcon,
                title: 'Change PIN',
              ),
              const SizedBox(height: 10),

              const PSettingsMenuTile(
                prefixImage: PImages.shareQRIcon,
                title: 'Share QR code',
              ),
              const SizedBox(height: 10),

              const PSettingsMenuTile(
                prefixImage: PImages.scanQRIcon,
                title: 'Scan QR code',
              ),
              const SizedBox(height: 10),

              PSettingsMenuTile(
                prefixImage: PImages.subscriptionIcon,
                title: 'Subscription',
                onTap: () => Get.to(() => SubscriptionScreen()),
              ),
              const SizedBox(height: 10),

              const PSettingsMenuTile(
                prefixImage: PImages.aboutUsIcon,
                title: 'About us',
              ),
              const SizedBox(height: 10),

              const PSettingsMenuTile(
                prefixImage: PImages.logoutIcon,
                title: 'Log out',
                endIcon: false,
              ),
              const Spacer(),

              /// Terms and Privacy
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: PTermsAndPrivacyWidget(),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
