import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/authentication/screens/signup/verify_email.dart';
import 'package:e_mart/features/personalization/models/user_model.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/full_screen_loader.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // ==SIGNUP
  void signup() async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog(
          'We are processing your information...', PImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        PLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in he Firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authentication user data in the Firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        username: username.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Show Success Message
      PLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Vrify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}