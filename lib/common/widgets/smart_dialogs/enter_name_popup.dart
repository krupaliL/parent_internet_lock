import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/validators/validation.dart';

class EnterNamePopup extends StatelessWidget {
  const EnterNamePopup({
    super.key,
    this.isCancelButton = true,
  });

  final bool isCancelButton;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Title
          const Text(
            'Enter your name',
            style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 16.0, color: PColors.black),
          ),
          const SizedBox(height: 10),

          /// Enter Name
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            decoration: BoxDecoration(
              color: PColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: PColors.outlinedBorder,
                width: 1,
              ),
            ),
            child: TextFormField(
              validator: (value) => PValidator.validateEmptyText('name', value),
              style: const TextStyle(
                color: PColors.primary,
                fontSize: 13,
                fontFamily: 'LexendDeca', fontWeight: FontWeight.w400,
              ),
              decoration: const InputDecoration(
                hintText: 'Enter name',
              ),
              cursorColor: PColors.primary,
            ),
          ),
          const SizedBox(height: 25),

          /// Cancel and Save buttons
          Row(
            children: [
              if (isCancelButton)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      SmartDialog.dismiss();
                    },
                    style: OutlinedButton.styleFrom(),
                    child: const Text(PTexts.cancel),
                  ),
                ),

              if (isCancelButton)
                const SizedBox(width: 12),

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
                  child: Text(isCancelButton ? PTexts.save : 'Add'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}