import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/common/widgets/smart_dialogs/enter_name_popup.dart';
import 'package:parent_internet_lock/common/widgets/smart_dialogs/logout_popup.dart';
import 'package:parent_internet_lock/features/authentication/controller/user_controller.dart';
import 'package:parent_internet_lock/features/authentication/screens/other_person_login/other_person_login.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/enter_pin.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/scanner/qr_scanner_screen.dart';
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
    final controller = Get.put(UserController());

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      /// Setting Tiles
                      PSettingsMenuTile(
                        prefixImage: PImages.userIcon,
                        title: 'Profile Name',
                        profileIcon: true,
                        onTap: () {
                          // Show the custom dialog
                          SmartDialog.show(
                            builder: (_) {
                              return const EnterNamePopup();
                            },
                          );
                        },
                      ),

                      PSettingsMenuTile(
                        prefixImage: PImages.keyIcon,
                        title: 'Change PIN',
                        onTap: () => Get.to(() => const EnterPinScreen()),
                      ),

                      PSettingsMenuTile(
                        prefixImage: PImages.shareQRIcon,
                        title: 'Share QR code',
                        onTap: () {
                          Get.to(() => OtherPersonLoginScreen(qrData: jsonEncode(controller.user.toJson()),));
                        },
                      ),

                      PSettingsMenuTile(
                        prefixImage: PImages.scanQRIcon,
                        title: 'Scan QR code',
                        onTap: () {
                          Get.to(() => QRScannerScreen());
                        },
                      ),

                      PSettingsMenuTile(
                        prefixImage: PImages.subscriptionIcon,
                        title: 'Subscription',
                        onTap: () => Get.to(() => SubscriptionScreen()),
                      ),

                      const PSettingsMenuTile(
                        prefixImage: PImages.aboutUsIcon,
                        title: 'About us',
                      ),

                      PSettingsMenuTile(
                        prefixImage: PImages.logoutIcon,
                        title: 'Log out',
                        endIcon: false,
                        onTap: () {
                          // Show the custom dialog
                          SmartDialog.show(
                            builder: (_) {
                              return const LogoutPopup();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /// Terms and Privacy
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 10),
                  Center(
                    child: PTermsAndPrivacyWidget(),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        )
    );
  }
}
