import 'package:e_mart/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = PHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: PDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: PSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.doNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? PColors.light : PColors.dark, dotHeight: 6),
      ),
    );
  }
}
