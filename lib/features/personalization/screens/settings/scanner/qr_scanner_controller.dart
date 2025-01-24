import 'dart:convert';

import 'package:get/get.dart';
import 'package:parent_internet_lock/features/authentication/controller/user_controller.dart';
import 'package:parent_internet_lock/features/internet/controllers/home_controller.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/popup/loaders.dart';
import '../../../../authentication/models/user_model.dart';

class QRScannerController extends GetxController {
  var qrCode = ''.obs;
  var isScanning = false.obs;
  QRViewController? qrViewController;
  final userController = Get.put(UserController());
  final homeController = Get.put(HomeController());

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    isScanning.value = true;

    qrViewController?.scannedDataStream.listen((scanData) async{
      qrCode.value = scanData.code!;
      isScanning.value = false;
      qrViewController?.pauseCamera(); // Stop scanning after the first scan

      UserModel user = UserModel.fromJson(jsonDecode(qrCode.value));
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(user.id != userId){
        await userController.saveScannedUserRecord(qrCode.value);

        Get.offAll(() => const NavigationMenu());
      } else {
        PLoaders.errorSnackBar(title: 'Ooops!', message: 'You can\'t scan your own device.');
      }
    });
  }
}

