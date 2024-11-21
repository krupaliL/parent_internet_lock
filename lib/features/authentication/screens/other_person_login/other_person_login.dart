import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class OtherPersonLoginScreen extends StatelessWidget {
  const OtherPersonLoginScreen({
    super.key,
    required this.qrData,
  });

  final String qrData;

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
            QrImageView(
              size: 240,
              data: qrData,
              version: QrVersions.auto,
            ),
            // const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
