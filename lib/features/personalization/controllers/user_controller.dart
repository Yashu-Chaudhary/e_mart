import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/personalization/models/user_model.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Conver Name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.genrateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          email: userCredentials.user!.email ?? '',
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
          username: username,
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      PLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Somethin went wrong while saving yout information. You can re-save your data in your Profile.',
      );
    }
  }
}
