import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_model.dart';
import '../authentication/authentication_repository.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final userId = AuthenticationRepository.instance.authUser!.uid;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'saveUserRecord');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to save scanned user data to Firestore.
  Future<void> saveScannedUserRecord(String userData) async {
    try {
      UserModel user = UserModel.fromJson(jsonDecode(userData));
      await _db.collection("Users").doc(userId).collection("My Devices").add(user.toJson());
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'saveScannedUserRecord');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to get user's scanned data from Firestore.
  Future<List<UserModel>> getScannedUserRecord() async {
    try {
      final snapshot = await _db.collection("Users").doc(userId).collection("My Devices").get();

      final list = snapshot.docs.map((document) => UserModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'getScannedUserRecord');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      // log("${AuthenticationRepository.instance.authUser?.uid}", name: "UserId");
      final documentSnapshot = await _db.collection("Users").doc(userId).get();
      if(documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'fetchUserDetails');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update user data to Firestore.
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'updateUserDetails');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specific Users Collection.
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(userId).update(json);

      await _db.collection("Users").doc(userId).collection("My Devices").doc().update(json);
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'updateSingleField');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Update any field in specific Collection of user.
  Future<void> updateScannedUserSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(userId).update(json);
      // final snapshot = await _db.collection("Users").doc(userId).collection("My Devices").get();
      // List<String> deviceIds = snapshot.docs.map((doc) => doc.id).toList();
      //
      // await _db.collection("Users").doc(userId).collection("My Devices").doc().update(json);
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'updateSingleField');
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'removeUserRecord');
      throw 'Something went wrong. Please try again';
    }
  }

  /*
  /// Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      log(e.toString(), name: 'removeUserRecord');
      throw 'Something went wrong. Please try again';
    }
  }
  */
}