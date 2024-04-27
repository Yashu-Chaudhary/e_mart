// Contoller to manage user-related functionlaity.
import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/features/personalization/screens/profile/profile.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/full_screen_loader.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog(
          'We are updating your information...', PImages.docerAnimation);

      // Check Internet Connectinvity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      PFullScreenLoader.stopLoading();

      // Show Success Message
      PLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
