import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class OtherPersonLoginScreen extends StatelessWidget {
  const OtherPersonLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                /// Titles
                child: Column(
                  children: [
                    Text(
                      PTexts.scannerTitle,
                      style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w700, fontSize: 24.0, color: PColors.primary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      PTexts.scannerSubTitle2,
                      style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 75),

              /// QR Code
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: PColors.primary, width: 1.5), // Border around the text
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "7-days free trial, then \$1/month",
                              style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.primary),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(138, 44),
                                  backgroundColor: PColors.primary, // OK button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "OK",
                                  style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 16.0, color: PColors.white),
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                style: OutlinedButton.styleFrom(
                                  fixedSize: const Size(138, 44),
                                  side: const BorderSide(color: PColors.black50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 16.0, color: PColors.black50),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image(image: AssetImage(PImages.qrCode)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
