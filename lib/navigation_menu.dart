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
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: PColors.white,
          indicatorColor: PColors.primary,

          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home',),
            NavigationDestination(icon: Icon(Icons.watch_later_rounded), label: 'Minutes'),
            NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Setting'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    const MinutesScreen(),
    const SettingsScreen()
  ];
}