import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

import '../../../features/authentication/controller/login/login_controller.dart';
import '../../../utils/validators/validation.dart';

class PPasswordFieldWidget extends StatelessWidget {
  const PPasswordFieldWidget({
    super.key,
    required this.title,
    required this.prefixIcon,
    required this.validateText,
    this.controller,
  });

  final String title;
  final IconData prefixIcon;
  final String validateText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 14.0, color: PColors.primary),
          ),
          const SizedBox(height: 8),
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
                  child: Obx(
                    () => TextFormField(
                      controller: controller.password,
                      validator: (value) => PValidator.validateEmptyText(validateText, value),
                      obscureText: true,
                      style: const TextStyle(
                        color: PColors.primary,
                        fontSize: 13,
                        fontFamily: 'LexendDeca', fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                        ),
                      ),
                      cursorColor: PColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Iconsax.eye_slash, color: PColors.primary),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}