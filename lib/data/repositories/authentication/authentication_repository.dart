// ignore_for_file: non_constant_identifier_names

import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_mart/features/authentication/screens/signup/verify_email.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:e_mart/utils/exceptions/format_exceptions.dart';
import 'package:e_mart/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    // Remove the natibr splash screen
    FlutterNativeSplash.remove();
    // redirect to the appropriate screen
    screenRedirect();
  }

// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //  Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
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
    } on FormatException catch (_) {
      throw const PFormatExcepton();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatExcepton();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD

  /*-----------------Federated identity &social sign-in ----------- */

  ///[GoogleAuthentication] - GOOGLE

  ///[FacabookAuthentication] - FACEBOOK

  /*--------------./end Federated identity & social sign-in -------------- */

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatExcepton();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    }
  }

  /// DELETE USER -Remove user Auth and Firestore Account.
  ///
  // / ----------------------------------
}
