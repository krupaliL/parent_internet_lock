import 'package:flutter/material.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Signup Image
              Image(image: AssetImage(PImages.signupImage)),
              SizedBox(height: 30.0),

              /// Form
              PSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
