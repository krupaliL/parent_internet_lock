import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/confirm_pin.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../common/widgets/pinput_widget/pinput_widget_with_title.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class EnterPinScreen extends StatelessWidget {
  const EnterPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const SizedBox(height: 34.0),
              /// Enter PIN Image
              const Image(image: AssetImage(PImages.enterOtp)),
              const SizedBox(height: 50.0),

              /// Enter PIN
              const PPinputWidgetWithTitle(title: PTexts.enterPIN),

              /// Forgot PIN
              TextButton(
                onPressed: () => Get.to(() => const ConfirmPinScreen()),
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  PTexts.forgotPIN,
                  style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 14.0, color: PColors.primary),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
