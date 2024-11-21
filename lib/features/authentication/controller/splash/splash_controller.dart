import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();


  void nextPage() {
      final storage = GetStorage();

      if(kDebugMode) {
        print('------------------ GET STORAGE NEXT BUTTON --------------------');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);

      if(kDebugMode) {
        print('------------------ GET STORAGE NEXT BUTTON --------------------');
        print(storage.read('IsFirstTime'));
      }
      Get.offAll(const LoginScreen());
  }
}