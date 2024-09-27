import 'package:flutter/material.dart';
import 'package:parent_internet_lock/features/internet/models/device_list_model.dart';
import 'package:parent_internet_lock/features/internet/screens/home/widgets/device_card_widget.dart';
import 'package:parent_internet_lock/features/internet/screens/home/widgets/home_appbar.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final deviceList = DeviceListModel.deviceList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PHomeAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),

            /// Title
            child: deviceList.isEmpty
                ? null
                : const Text(
                    'Device list',
                    style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 18.0, color: PColors.black),
                    // textAlign: TextAlign.center,
                  ),
          ),
          const SizedBox(height: 15),

          /// List of Device
          Expanded(
            child: deviceList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 300,
                          width: 310,
                          image: AssetImage(PImages.noDeviceFoundImage),
                        ),
                        SizedBox(height: 18),
                        Text(
                          'There are no Device found!',
                          style: TextStyle(fontFamily: 'LexendDeca', fontWeight: FontWeight.w500, fontSize: 16.0, color: PColors.darkBlue),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: deviceList.length,
                    itemBuilder: (context, index) {
                      var device = deviceList[index];
                      return PDeviceCard(
                        name: device['name'],
                        device: device['device'],
                        status: device['status'],
                        isOnline: device['isOnline'],
                        backgroundColor: device['backgroundColor'],
                      );
                    },
                  ),
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
