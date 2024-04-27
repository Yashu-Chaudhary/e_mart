import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/full_screen_loader.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  get userController => null;

  // @override
  // void onInit() {
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   super.onInit();
  // }

  // -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog(
          'Logging you in...', PImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using EMail & password Authentication

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // -- Google SignIn Autentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog(
          'Logging you in...', PImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.siginInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove loder
      PFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
