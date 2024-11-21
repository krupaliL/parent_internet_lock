import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controller/forgot_password/forgot_password_controller.dart';
import '../login/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(PImages.verifyEmail),
                width: MediaQuery.of(Get.context!).size.width * 0.6,
              ),
              const SizedBox(height: 32),

              /// Title & SubTitle
              Text(
                email,
                style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                PTexts.changeYourPasswordTitle,
                style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 22.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                PTexts.changeYourPasswordSubTitle,
                style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(PTexts.done),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(
                    PTexts.resendEmail,
                    style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 13.0, color: PColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
