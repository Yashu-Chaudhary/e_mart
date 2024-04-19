
import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/full_screen_loader.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      // startt Loading
      PFullScreenLoader.openLoadingDialog(
          'Processing your request...', PImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // remove loader
      PFullScreenLoader.stopLoading();

      // show succes screen
      PLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      // redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog(
          'Processing your request...', PImages.docerAnimation);

      // check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Show Success Screen
      PLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

     
    } catch (e) {
      // Remove Loader
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
