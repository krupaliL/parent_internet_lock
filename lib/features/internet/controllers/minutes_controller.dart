import 'package:get/get.dart';

class MinutesController extends GetxController {
  // Observable variable for selected index
  var selectedIndex = 1.obs;

  // Function to update selected index
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}