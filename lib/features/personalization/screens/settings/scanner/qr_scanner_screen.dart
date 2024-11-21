import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'qr_scanner_controller.dart';

class QRScannerScreen extends StatelessWidget {
  QRScannerScreen({super.key});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final QRScannerController controller = Get.put(QRScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: controller.onQRViewCreated,
          ),
          Positioned(
            // top: 60,
            left: 18,
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  color: PColors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: PColors.primary,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 80,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    PTexts.scannerTitle,
                    style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w700, fontSize: 24.0, color: PColors.primary),
                  ),
                  SizedBox(height: 10),
                  Text(
                    PTexts.scannerSubTitle1,
                    style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
