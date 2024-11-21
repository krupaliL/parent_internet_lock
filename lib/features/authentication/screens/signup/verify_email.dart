import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controller/signup/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      /// The close icon in the app bar is used to log out the user and redirect them to the login screen.
      /// This approach is taken to handle scenarios where the user enters the registration process,
      /// and the data is stored. Upon reopening the app, it checks if the email is verified.
      /// If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(PImages.verifyEmail),
                width: MediaQuery.of(Get.context!).size.width * 0.6,
              ),
              const SizedBox(height: 32.0),

              /// Title & SubTitle
              const Text(
                PTexts.confirmEmail,
                style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 22.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                email ?? '',
                style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                PTexts.confirmEmailSubTitle,
                style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 12.0, color: PColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(PTexts.pContinue),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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
