import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class OtherPersonLoginScreen extends StatelessWidget {
  const OtherPersonLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
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
              SizedBox(height: 75),

              /// QR Code
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Image(image: AssetImage(PImages.qrCode)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
