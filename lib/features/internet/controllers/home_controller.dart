import 'package:get/get.dart';
import 'package:parent_internet_lock/data/repositories/user/user_repository.dart';

import '../../../utils/popup/loaders.dart';
import '../../authentication/models/user_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final isLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  RxList<UserModel> allDeviceList = <UserModel>[].obs;

  @override
  Future<void> onInit() async {
    fetchUserDevices();
    super.onInit();
  }

  Future<void> fetchUserDevices() async {
    try {
      isLoading.value = true;
      final devices = await userRepository.getScannedUserRecord();
      allDeviceList.assignAll(devices);
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}