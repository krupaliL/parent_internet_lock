import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_internet_lock/utils/constants/image_strings.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../controllers/minutes_controller.dart';

class MinutesList extends StatelessWidget {
  MinutesList({super.key});

  // Initialize the controller
  final MinutesController controller = Get.put(MinutesController());

  // List of time options
  final List<int> timeOptions = [0, 1, 2, 3, 5, 10, 20, 25, 30];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Use Expanded to ensure the ListView takes up available space
            Expanded(
              child: ListView.builder(
                itemCount: timeOptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Update selected index using the controller
                      controller.updateSelectedIndex(index);
                    },
                    child: Obx(() => Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),

                      /*
                      decoration: BoxDecoration(
                        color: PColors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 0.3, // Spread radius
                            blurRadius: 0.5, // Blur radius
                            offset: const Offset(0, 0), // Offset in x and y direction
                          ),
                        ],
                      ),
                      */

                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Text(
                                  "${timeOptions[index]} Minutes",
                                  style: TextStyle(
                                    fontFamily: 'LexendDeca',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    color: controller.selectedIndex.value == index
                                        ? PColors.primary
                                        : PColors.black,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                if (controller.selectedIndex.value == index)
                                  const Text(
                                    '30 Second',
                                    style: TextStyle(
                                      fontFamily: 'LexendDeca',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                      color: PColors.black50,
                                    ),
                                  ),
                                const SizedBox(width: 14),
                                if (controller.selectedIndex.value == index)
                                  const Image(height: 24, width: 24, image: AssetImage(PImages.checkIcon)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
