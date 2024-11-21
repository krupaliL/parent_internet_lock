import 'package:flutter/material.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

import '../../../utils/validators/validation.dart';

class PTextFormFieldWidget extends StatelessWidget {
  const PTextFormFieldWidget({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.validateText,
    this.controller,
    this.isEmail = false,
  });

  final String title;
  final IconData prefixIcon;
  final String? validateText;
  final bool isEmail;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            title,
            style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
          ),
          const SizedBox(height: 8),

          /// TextField
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            width: double.infinity,
            decoration: BoxDecoration(
              color: PColors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.3,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                Icon(prefixIcon, color: PColors.primary),
                const SizedBox(width: 12),
                Container(
                  width: 1,
                  height: 44,
                  color: PColors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    validator: (value) {
                      if(isEmail) {
                        return PValidator.validateEmail(value);
                      } else {
                        return PValidator.validateEmptyText(validateText, value);
                      }

                    },
                    style: const TextStyle(
                      color: PColors.primary,
                      fontSize: 13,
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w400,
                    ),
                    cursorColor: PColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}