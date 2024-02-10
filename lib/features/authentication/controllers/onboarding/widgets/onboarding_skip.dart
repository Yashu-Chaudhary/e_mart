import 'package:e_mart/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: PDeviceUtils.getAppBarHeight(),
        right: PSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
