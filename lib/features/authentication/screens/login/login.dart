import 'package:flutter/material.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/features/authentication/screens/login/widgets/login_form.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Login Image
              Image(image: AssetImage(PImages.loginImage)),

              /// Form
              PLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
