import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

// Function to Show Relevant Screen
  screenRedirect() async {
    //  Local Storage
    if (kDebugMode) {
      print('==============Get Storage====================');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* ----------Email & Password sign-in----------------- */

  ///[EmailAuthentication] -SignIn

  ///[EmailAuthentication]- REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const PFormatException();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. Please try again'; 
    }
  }
  
 

  ///[ReAuthenticate] - ReAuthenticate User

  ///[EmailVerification] - MAIL VERIFICATION

  /// [EmailAuthentication] - FORGET PASSWORD

  /*-----------------Federated identity &social sign-in ----------- */

  ///[GoogleAuthentication] - GOOGLE

  ///[FacabookAuthentication] - FACEBOOK

  /*--------------./end Federated identity & social sign-in -------------- */

  /// [LogoutUser] - Valid for any authentication.

  /// DELETE USER -Remove user Auth and Firestore Account.
  /// 
  // / ----------------------------------
   PFirebaseAuthException(String code) {}
  
  PFirebaseException(String code) {}
  
  PPlatformException(String code) {}
}
