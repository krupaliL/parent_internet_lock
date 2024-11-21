/*
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController extends GetxController {
  var isConnected = false.obs;  // Observing the connection status

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
    monitorConnectivity();
  }

  // Function to check initial connection
  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }

  // Function to monitor real-time changes
  void monitorConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        isConnected.value = true;
      } else {
        isConnected.value = false;
      }
    });
  }
}
*/
