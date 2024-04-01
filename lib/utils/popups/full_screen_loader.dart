import 'package:e_mart/common/widgets/loaders/animation_loader.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// A utility class for managing a full-screen loading dialog.
class PFullScreenLoader {
  // Open a full-screen loading dialog with a given text and animation.
  // this method doesn't return anything.

  // Parameters:
  //  - text: The text to be displayed in the loading dialog.
  //  - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,  // use Get.overlayContext for overlay dialogs
      barrierDismissible: false,     // The dialog can't be dismissed by tapping outside it.
      builder: (_) => PopScope(
        canPop: false,              // Disable popping with the back button
        child: Container(
          color: PHelperFunctions.isDarkMode(Get.context!)
              ? PColors.dark
              : PColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              PAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

// Stop the currently open loading dialog.
// Thismethod doesn,t return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
