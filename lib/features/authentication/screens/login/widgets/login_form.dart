import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/common/widgets/text_form_field_widgets/password_field_widget.dart';
import 'package:parent_internet_lock/features/authentication/screens/other_person_login/other_person_login.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:parent_internet_lock/features/authentication/screens/signup/signup.dart';
import 'package:parent_internet_lock/navigation_menu.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';
import '../../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../../common/widgets/text_form_field_widgets/text_form_field_widget.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Email
          const PTextFormFieldWidget(
            title: PTexts.email,
            prefixIcon: Icons.mail_outline,
            validateText: 'email',
          ),
          const SizedBox(height: 28),

          /// Password
          const PPasswordFieldWidget(
            title: PTexts.password,
            prefixIcon: Icons.lock_outline,
            validateText: 'password',
          ),
          const SizedBox(height: 15),

          /// Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Get.to(() => const ForgotPasswordScreen()),
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  PTexts.forgotPassword,
                  style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 14.0, color: PColors.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          /// Login Button
          PElevatedButtonWidget(onPressed: () => Get.to(() => const NavigationMenu()), title: PTexts.login),
          const SizedBox(height: 15),

          /// Scanner Button
          PElevatedButtonWidget(onPressed: () => Get.to(() => const OtherPersonLoginScreen()), title: PTexts.scanORCode),
          const SizedBox(height: 15),

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
    );
  }
}