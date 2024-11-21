import 'package:parent_internet_lock/features/authentication/models/user_model.dart';

class DeviceListModel{
  static List<UserModel> deviceList = [
    UserModel(id: "", name: "Krupali", email: "k@gmail.com", deviceToken: "token", deviceName: "Samsung", isConnected: false),
    UserModel(id: "", name: "Krupali", email: "k@gmail.com", deviceToken: "token", deviceName: "Samsung", isConnected: false),
    UserModel(id: "", name: "Krupali", email: "k@gmail.com", deviceToken: "token", deviceName: "Samsung", isConnected: false),
    UserModel(id: "", name: "Krupali", email: "k@gmail.com", deviceToken: "token", deviceName: "Samsung", isConnected: true),
    UserModel(id: "", name: "Krupali", email: "k@gmail.com", deviceToken: "token", deviceName: "Samsung", isConnected: true),
    UserModel(id: "", name: "Krupali", email: "k@gmail.com", deviceToken: "token", deviceName: "Samsung", isConnected: true),
  ];

  // static List<Map<String, dynamic>> deviceList = [];
}