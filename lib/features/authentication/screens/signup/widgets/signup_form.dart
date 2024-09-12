import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parent_internet_lock/common/widgets/text_form_field_widgets/password_field_widget.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';
import '../../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../../common/widgets/text_form_field_widgets/text_form_field_widget.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Name
          const PTextFormFieldWidget(
            title: PTexts.name,
            prefixIcon: Iconsax.user,
            validateText: 'name',
          ),
          const SizedBox(height: 28),

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
          const SizedBox(height: 28),

          /// Confirm Password
          const PPasswordFieldWidget(
            title: PTexts.confirmPassword,
            prefixIcon: Icons.lock_outline,
            validateText: 'password',
          ),
          const SizedBox(height: 32),

          /// Register Button
          PElevatedButtonWidget(onPressed: () {}, title: PTexts.register),
        ],
      ),
    );
  }
}