import 'package:e_mart/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Positioned(
        right: PSizes.defaultSpace,
        bottom: PDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? PColors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
