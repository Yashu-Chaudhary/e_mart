import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/features/personalization/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Repsitory class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  
  

  // Function to fetch user details based on  user ID.

  // Function to update user data in Firestore.


// ----------------------------------
PFirebaseException(String code) {}
  
  PPlatformException(String code) {}

}

class PFormatException {
  const PFormatException();
}
