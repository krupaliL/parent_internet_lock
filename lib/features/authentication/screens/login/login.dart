import 'package:flutter/material.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/features/authentication/screens/login/widgets/login_form.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: PSpacingStyle.paddingWithAppBarHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Image
              Image(height: 300, width: 310, image: AssetImage(PImages.loginImage)),
              SizedBox(height: 10),

              /// Form
              PLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
