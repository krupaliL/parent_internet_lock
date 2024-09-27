import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/authentication/screens/login/login.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            const Image(image: AssetImage(PImages.splashImage)),
            const SizedBox(height: 36.0),
            const Text(
              PTexts.splashTitle,
              style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 26.0, color: PColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            const Text(
              PTexts.splashSubTitle,
              style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 16.0, color: PColors.black50),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: PColors.grey.withOpacity(0.7),
                    spreadRadius: 0.3,
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                child: const Row(
                  children: [
                    Spacer(),
                    Text(PTexts.pContinue),
                    SizedBox(width: 10.0),
                    Image(image: AssetImage(PImages.continueIcon), height: 17.52, width: 31,),
                    Spacer()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
