import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popup/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveScannedUserRecord(String userData) async {
    try {
      profileLoading.value = true;
      await userRepository.saveScannedUserRecord(userData);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    final String? deviceToken = await FirebaseMessaging.instance.getToken();
    final String deviceName = await getDeviceName();
    final isConnected = await NetworkManager.instance.isConnected();
    print('Device Name from UC: $deviceName');
    try {
      // First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            name: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
            deviceToken: deviceToken ?? '',
            deviceName: deviceName,
            isConnected: isConnected,
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      PLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model; // Device name on Android
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.name; // Device name on iOS
    } else {
      return 'Unsupported Platform';
    }
  }

/*
  /// Delete Account Waring
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(16),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: Text('Delete')),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing', PImages.doctorAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.deleteAccount();
          PFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          PFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  */

/*
  /// -- RE-AUTHENTICATION before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.doctorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  */

/*
  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update User Image Record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
  */
}
