import 'package:e_mart/common/widgets/loaders/animation_loader.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
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
