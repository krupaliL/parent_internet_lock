import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popup/full_screen_loader.dart';
import '../../../../utils/popup/loaders.dart';

class LoginController extends GetxController {

  /// Variables
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {

    try{
      // Start Loading
      PFullScreenLoader.openLoadingDialog('Logging you in...', PImages.doctorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        PFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!loginFormKey.currentState!.validate()) {
        // Remove Loader
        PFullScreenLoader.stopLoading();
        return;
      }

      // Login user using EMail & Password Authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch(e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

/*
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog('Logging you in...', PImages.doctorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }


      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);


      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }*/
}