import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parent_internet_lock/features/authentication/models/user_model.dart';

import '../../../../../utils/constants/colors.dart';


class PDeviceCard extends StatelessWidget {
  const PDeviceCard({
    super.key,
   required this.userModel,
  });

final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: userModel.isConnected ? Colors.green.shade100:Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Name of user
                Text(
                  userModel.name,
                  style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 16.0, color: PColors.black),
                ),

                Row(
                  children: [

                    /// Device Name
                    Text(
                      userModel.deviceName,
                      style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.black50),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Iconsax.award,
                      color: Colors.amber.shade400,
                    ),
                  ],
                ),
              ],
            ),
            // const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Internet Status (enable/disable)
                Text(
                  userModel.isConnected ? "Internet Disable" : '',
                  style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.internetColor),
                ),
                // const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    /// Power Button
                    IconButton(
                      // iconSize: 24,
                      onPressed: () {},
                      icon: const Icon(Icons.power_settings_new_rounded),
                      color: userModel.isConnected ? PColors.internetColor : PColors.black50,
                    ),
                    // const SizedBox(width: 16),

                    /// Delete Button
                    IconButton(
                      onPressed: () {},
                      // padding: EdgeInsets.only(right: 0.0),
                      icon: const Icon(Icons.delete_rounded),
                      color: PColors.delete,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}