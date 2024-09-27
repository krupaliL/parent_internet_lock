import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

import '../../../utils/constants/colors.dart';

class FreeTrialPopup extends StatelessWidget {
  const FreeTrialPopup({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.87,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Free Trial Text
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            width: double.infinity,
            decoration: BoxDecoration(
              color: PColors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: PColors.primary,
                width: 1,
              ),
            ),
            child: const Text(
              '7-days free trial, then \$1/month',
              style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 13.5, color: PColors.primary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          /// Ok and Cancel buttons
          Row(
            children: [
              Expanded(
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
                  child: const Text('OK'),
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    SmartDialog.dismiss();
                  },
                  style: OutlinedButton.styleFrom(),
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