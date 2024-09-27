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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Update Password Image
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Image(image: AssetImage(PImages.passwordUpdate)),
                    ),
                    SizedBox(height: 20),

                    /// Title & SubTitle
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Text(
                            PTexts.passwordUpdateTitle,
                            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w700, fontSize: 24.0, color: PColors.primary),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            PTexts.passwordUpdateSubTitle,
                            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    /// Password
                    PPasswordFieldWidget(
                      title: PTexts.newPassword,
                      prefixIcon: Icons.lock_outline,
                      validateText: 'password',
                    ),
                    SizedBox(height: 20),

                    /// Confirm Password
                    PPasswordFieldWidget(
                      title: PTexts.confirmPassword,
                      prefixIcon: Icons.lock_outline,
                      validateText: 'password',
                    ),

                    SizedBox(height: 5),
                  ],
                ),
              )
            ),

            Column(
              children: [
                const SizedBox(height: 10),
                /// Send Button
                PElevatedButtonWidget(onPressed: () => Get.to(() => const EnterPinScreen()), title: PTexts.save),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
