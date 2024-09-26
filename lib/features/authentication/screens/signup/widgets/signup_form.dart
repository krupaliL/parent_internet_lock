import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parent_internet_lock/common/widgets/text_form_field_widgets/password_field_widget.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';
import '../../../../../common/widgets/text_form_field_widgets/text_form_field_widget.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          /// Name
          PTextFormFieldWidget(
            title: PTexts.name,
            prefixIcon: Iconsax.user,
            validateText: 'name',
          ),
          SizedBox(height: 28),

          /// Email
          PTextFormFieldWidget(
            title: PTexts.email,
            prefixIcon: Icons.mail_outline,
            validateText: 'email',
          ),
          SizedBox(height: 28),

          /// Password
          PPasswordFieldWidget(
            title: PTexts.password,
            prefixIcon: Icons.lock_outline,
            validateText: 'password',
          ),
          SizedBox(height: 28),

          /// Confirm Password
          PPasswordFieldWidget(
            title: PTexts.confirmPassword,
            prefixIcon: Icons.lock_outline,
            validateText: 'password',
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}