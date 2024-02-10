import 'package:e_mart/features/authentication/controllers/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_mart/features/authentication/controllers/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_mart/features/authentication/controllers/onboarding/widgets/onboarding_page.dart';
import 'package:e_mart/features/authentication/controllers/onboarding/widgets/onboarding_skip.dart';
import 'package:e_mart/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // ........Horizontal Scrollable Pages......
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: PImages.onBoardingImage1,
                title: PText.onBoardingTitle1,
                subTitle: PText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: PImages.onBoardingImage2,
                title: PText.onBoardingTitle2,
                subTitle: PText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: PImages.onBoardingImage3,
                title: PText.onBoardingTitle3,
                subTitle: PText.onBoardingSubTitle3,
              ),
            ],
          ),
          // ...........Skip Button............
          const OnBoardingSkip(),

          // Do Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

