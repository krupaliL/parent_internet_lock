import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popup/full_screen_loader.dart';
import '../../../../utils/popup/loaders.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try{
      // Start Loading
      PFullScreenLoader.openLoadingDialog('Processing your request...', PImages.doctorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {PFullScreenLoader.stopLoading(); return;}

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      log(email.text, name: 'krupali');
      // Send EMail to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Show Success Screen
      PLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();
      log(e.toString(), name: 'krupali :');
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      // Start Loading
      PFullScreenLoader.openLoadingDialog('Processing your request...', PImages.doctorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {PFullScreenLoader.stopLoading(); return;}

      // Send EMail to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Show Success Screen
      PLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

    } catch (e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}