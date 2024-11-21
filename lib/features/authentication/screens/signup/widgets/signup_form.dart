import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parent_internet_lock/features/authentication/controller/signup/signup_controller.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';
import '../../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../../common/widgets/text_form_field_widgets/text_form_field_widget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/validators/validation.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// Name
          PTextFormFieldWidget(
            controller: controller.name,
            title: PTexts.name,
            prefixIcon: Iconsax.user,
            validateText: 'name',
          ),
          const SizedBox(height: 28),

          /// Email
          PTextFormFieldWidget(
            controller: controller.email,
            title: PTexts.email,
            prefixIcon: Icons.mail_outline,
            isEmail: true,
          ),
          const SizedBox(height: 28),

          /// Password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  PTexts.password,
                  style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: PColors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.lock_outline, color: PColors.primary),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 44,
                        color: PColors.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Obx(
                          () => TextFormField(
                            controller: controller.password,
                            validator: (value) => PValidator.validatePassword(value),
                            obscureText: controller.hidePassword.value,
                            style: const TextStyle(
                              color: PColors.primary,
                              fontSize: 13,
                              fontFamily: 'LexendDeca', fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye, color: PColors.primary,),
                              ),
                            ),
                            cursorColor: PColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          /// Confirm Password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  PTexts.confirmPassword,
                  style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: PColors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.lock_outline, color: PColors.primary),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 44,
                        color: PColors.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Obx(
                          () => TextFormField(
                            controller: controller.confirmPassword,
                            validator: controller.validateConfirmPassword,
                            obscureText: controller.hideConfirmPassword.value,
                            style: const TextStyle(
                              color: PColors.primary,
                              fontSize: 13,
                              fontFamily: 'LexendDeca', fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () => controller.hideConfirmPassword.value = !controller.hideConfirmPassword.value,
                                icon: Icon(controller.hideConfirmPassword.value ? Iconsax.eye_slash : Iconsax.eye, color: PColors.primary,),
                              ),
                            ),
                            cursorColor: PColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),


          /// Register Button
          PElevatedButtonWidget(
            onPressed: () => controller.signup(),
            title: PTexts.register,
          ),
        ],
      ),
    );
  }
}