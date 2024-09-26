import 'package:flutter/material.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Signup Image
                    Image(height: 240, width: 320, image: AssetImage(PImages.signupImage)),
                    SizedBox(height: 25.0),

                    /// Form
                    PSignupForm(),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                const SizedBox(height: 10),
                /// Register Button
                PElevatedButtonWidget(onPressed: () {}, title: PTexts.register),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
