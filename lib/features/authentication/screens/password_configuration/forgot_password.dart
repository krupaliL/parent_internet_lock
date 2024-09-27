import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/authentication/screens/password_configuration/update_password.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/elevated_button_widgets/elevated_button_widget.dart';
import '../../../../common/widgets/text_form_field_widgets/text_form_field_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(showBackArrow: true),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Forgot Password Image
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Image(height: 310, width: 275, image: AssetImage(PImages.forgotPassword)),
                    ),
                    SizedBox(height: 30),

                    /// Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Text(
                            PTexts.forgetPasswordTitle,
                            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w700, fontSize: 24.0, color: PColors.primary),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            PTexts.forgetPasswordSubTitle,
                            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    /// Email
                    PTextFormFieldWidget(
                      title: PTexts.email,
                      prefixIcon: Icons.mail_outline,
                      validateText: 'email',
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                const SizedBox(height: 10),

                /// Send Button
                PElevatedButtonWidget(onPressed: () => Get.to(() => const UpdatePasswordScreen()), title: PTexts.send),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
