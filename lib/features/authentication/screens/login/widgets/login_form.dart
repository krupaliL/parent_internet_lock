import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/common/widgets/text_form_field_widgets/password_field_widget.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';
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
          const SizedBox(height: 7),

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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}