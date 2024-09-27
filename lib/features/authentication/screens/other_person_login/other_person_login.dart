import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parent_internet_lock/common/widgets/smart_dialogs/free_trial_popup.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class OtherPersonLoginScreen extends StatelessWidget {
  const OtherPersonLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              /// Titles
              child: Column(
                children: [
                  Text(
                    PTexts.scannerTitle,
                    style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w700, fontSize: 24.0, color: PColors.primary),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    PTexts.scannerSubTitle2,
                    style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),

            /// QR Code
            GestureDetector(
              onTap: () {
                // Show the custom dialog
                SmartDialog.show(
                  builder: (_) {
                    return const FreeTrialPopup();
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Image(height: 260, width: 260, image: AssetImage(PImages.qrCode)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
