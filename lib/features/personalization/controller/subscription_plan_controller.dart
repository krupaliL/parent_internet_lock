import 'package:get/get.dart';
import 'package:parent_internet_lock/utils/constants/text_strings.dart';

class SubscriptionPlanController extends GetxController {
  // Observable variable for selected index
  var selectedPlan = PTexts.basic.obs;

  // Function to update selected index
  void updateSelectedPlan(String plan) {
    selectedPlan.value = plan;
  }
}