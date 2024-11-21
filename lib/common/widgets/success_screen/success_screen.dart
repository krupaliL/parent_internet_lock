import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';
import '../../styles/spacing_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(height: 30.0),

              /// Title & SubTitle
              Text(
                title,
                style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 22.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                subTitle,
                style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: const Text(PTexts.pContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
