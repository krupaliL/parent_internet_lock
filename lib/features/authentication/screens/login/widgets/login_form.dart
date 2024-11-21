import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';
import '../../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../../common/widgets/text_form_field_widgets/text_form_field_widget.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/login/login_controller.dart';
import '../../signup/signup.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
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
                  'Password',
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
                            validator: (value) => PValidator.validateEmptyText('password', value),
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
          const SizedBox(height: 5),

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
          PElevatedButtonWidget(onPressed: () => controller.emailAndPasswordSignIn(), title: PTexts.login),
          const SizedBox(height: 15),

          /// Scanner Button
          PElevatedButtonWidget(onPressed: () {}, title: PTexts.scanORCode),
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
    );
  }
}