import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> deviceList = [
    {
      'name': 'Savannah Nguyen',
      'device': 'One plus',
      'status': 'Active',
      'isOnline': false,
      'backgroundColor': Colors.grey.shade300
    },
    {
      'name': 'Cody Fisher',
      'device': 'iPhone 11',
      'status': 'Active',
      'isOnline': false,
      'backgroundColor': Colors.grey.shade300
    },
    {
      'name': 'Ralph Edwards',
      'device': 'iPhone 12 pro max',
      'status': 'Active',
      'isOnline': false,
      'backgroundColor': Colors.grey.shade300
    },
    {
      'name': 'Dipen dhaduk',
      'device': 'One plus',
      'status': 'Internet Disable',
      'isOnline': true,
      'backgroundColor': Colors.green.shade100
    },
    {
      'name': 'Brijesh sakhiya',
      'device': 'iPhone 15 pro',
      'status': 'Internet Disable',
      'isOnline': true,
      'backgroundColor': Colors.green.shade100
    },
    {
      'name': 'Hiren malaviya',
      'device': 'Google pixel 5',
      'status': 'Internet Disable',
      'isOnline': true,
      'backgroundColor': Colors.green.shade100
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PAppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w600, fontSize: 14.0, color: PColors.black),
          textAlign: TextAlign.center,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              // color: Colors.blue[100],
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: PColors.primary, width: 1.0),
            ),
            child: const Text(
              '1:30 Second',
              style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.primary),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Device list',
              style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 18.0, color: PColors.black),
              // textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          // Wrap ListView with Expanded to make it take available space
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: deviceList.length,
              itemBuilder: (context, index) {
                var device = deviceList[index];
                return deviceCard(
                  name: device['name'],
                  device: device['device'],
                  status: device['status'],
                  isOnline: device['isOnline'],
                  backgroundColor: device['backgroundColor'],
                );
              },
            ),
          ),
        ],
      ),

    );
  }

  Widget deviceCard({
    required String name,
    required String device,
    required String status,
    required bool isOnline,
    required Color backgroundColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),  // borderRadius of 5
      ),
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 16.0, color: PColors.black),
                ),
                Row(
                  children: [
                    Text(
                      device,
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
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isOnline ? status : '',
                  style: const TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w400, fontSize: 12.0, color: PColors.internetColor),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.power_settings_new_rounded,
                      // isOnline ? Icons.power : Icons.power_off,
                      color: isOnline ? PColors.internetColor : PColors.black50,
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.delete_rounded,
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