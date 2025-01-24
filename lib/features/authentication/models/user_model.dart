import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class representing user data.
class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  String name;
  final String email;
  final String deviceToken;
  final String deviceName;
  final bool isConnected;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.deviceToken,
    required this.deviceName,
    required this.isConnected,
  });

  /// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String cameCaseUsername = "$firstName$lastName"; // Combine first nd last name
    String usernameWithPrefix = "cwt_$cameCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  /// Static function to create on empty user model.
  static UserModel empty() => UserModel(id: '', name: '', email: '', deviceToken: '', deviceName: '', isConnected: false,);

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'Email': email,
      'DeviceToken': deviceToken,
      'DeviceName': deviceName,
      'IsConnected': isConnected,
    };
  }

  /// Factory method to create a UserModel from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['Name'] ?? '',
      email: json['Email'] ?? '',
      deviceToken: json['DeviceToken'] ?? '',
      deviceName: json['DeviceName'] ?? '',
      isConnected: json['IsConnected'] ?? false,
    );
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['Name'] ?? '',
        email: data['Email'] ?? '',
        deviceToken: data['DeviceToken'] ?? '',
        deviceName: data['DeviceName'] ?? '',
        isConnected: data['IsConnected'] ?? false,
      );
    } else {
      return UserModel.empty();
    }
  }
}