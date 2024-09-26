import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/common/styles/spacing_styles.dart';
import 'package:parent_internet_lock/features/authentication/screens/login/widgets/login_form.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../other_person_login/other_person_login.dart';
import '../signup/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    /// Login Image
                    Image(height: 300, width: 310, image: AssetImage(PImages.loginImage)),
                    SizedBox(height: 10),

                    /// Form
                    PLoginForm(),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                const SizedBox(height: 10),

                /// Login Button
                PElevatedButtonWidget(onPressed: () => Get.to(() => const NavigationMenu()), title: PTexts.login),
                const SizedBox(height: 15),

                /// Scanner Button
                PElevatedButtonWidget(onPressed: () => Get.to(() => const OtherPersonLoginScreen()), title: PTexts.scanORCode),
                // const SizedBox(height: 15),

                /// Don't have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      PTexts.dontHaveAccount,
                      style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 13.0, color: PColors.black32),
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => const SignupScreen()),
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                      ),
                      child: const Text(
                        PTexts.register,
                        style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 13.0, color: PColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
