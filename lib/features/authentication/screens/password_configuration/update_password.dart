import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/enter_pin.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../common/widgets/text_form_field_widgets/password_field_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// Update Password Image
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                child: Image(image: AssetImage(PImages.passwordUpdate)),
              ),
              // Image(height: 120, width: 138, image: AssetImage(PImages.passwordUpdate)),
              const SizedBox(height: 25),

              /// Title & SubTitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      PTexts.passwordUpdateTitle,
                      style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w700, fontSize: 24.0, color: PColors.primary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      PTexts.passwordUpdateSubTitle,
                      style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              /// Password
              const PPasswordFieldWidget(
                title: PTexts.newPassword,
                prefixIcon: Icons.lock_outline,
                validateText: 'password',
              ),
              const SizedBox(height: 20),

              /// Confirm Password
              const PPasswordFieldWidget(
                title: PTexts.confirmPassword,
                prefixIcon: Icons.lock_outline,
                validateText: 'password',
              ),
              const SizedBox(height: 150),
              // const Spacer(),

              /// Send Button
              PElevatedButtonWidget(onPressed: () => Get.to(() => const EnterPinScreen()), title: PTexts.save),
              // const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
