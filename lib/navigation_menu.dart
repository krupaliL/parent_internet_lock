import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/features/internet/screens/minutes/minutes.dart';
import 'package:parent_internet_lock/features/personalization/screens/settings/settings_screen.dart';
import 'package:parent_internet_lock/utils/constants/colors.dart';

import 'features/internet/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: PColors.black50,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.3,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: NavigationBar(
            height: 80,
            elevation: 15,
            shadowColor: PColors.black,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.changeIndex(index),
            backgroundColor: PColors.white,
            indicatorColor: PColors.primary,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_rounded,
                  color: controller.selectedIndex.value == 0
                      ? PColors.white
                      : PColors.black50,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.watch_later_rounded,
                  color: controller.selectedIndex.value == 1
                      ? PColors.white
                      : PColors.black50,
                ),
                label: 'Minutes',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings_rounded,
                  color: controller.selectedIndex.value == 2
                      ? PColors.white
                      : PColors.black50,
                ),
                label: 'Setting',
              ),
            ],
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(), const MinutesScreen(), const SettingsScreen()];

  // Method to change the selected index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
