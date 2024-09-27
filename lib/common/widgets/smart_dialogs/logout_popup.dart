import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

import '../../../utils/constants/colors.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          /// Logout Image
          const Image(height: 80, width: 80, image: AssetImage(PImages.logoutPopupIcon)),
          const SizedBox(height: 12),

          /// Title
          const Text(
            'Wifi Controller',
            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 18.0, color: PColors.darkBlue),
          ),
          const SizedBox(height: 4),

          /// Subtitle
          const Text(
            'Are you sure you want to logout?',
            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.black50),
          ),
          const SizedBox(height: 20),

          /// Logout and Cancel buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Logout'),
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: PColors.outlinedForegroundLogout,
                  ),
                  child: const Text(PTexts.cancel),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}