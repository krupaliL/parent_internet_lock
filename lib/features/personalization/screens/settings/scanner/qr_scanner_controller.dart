import 'package:get/get.dart';
import 'package:parent_internet_lock/features/authentication/controller/user_controller.dart';
import 'package:parent_internet_lock/features/internet/controllers/home_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../../navigation_menu.dart';

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

      await userController.saveScannedUserRecord(qrCode.value);
      // await homeController.fetchUserDevices();
      Get.offAll(() => const NavigationMenu());
    });
  }
}

