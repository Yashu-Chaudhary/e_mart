import 'package:e_mart/common/widgets/succiss_screen/success_screen.dart';
import 'package:e_mart/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());
    return Scaffold(
      // The closse incon in the app bar is used to log out the user and redirect them to the login screen.
      // This approach is taken to handle scenarios where the user enters the registration process,
      // and  the date is sotred. Upon reopening the app, it checks if the email is verified.
      // If not verified, the app always navigates to teh verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              // ...............Image...........
              Image(
                image: const AssetImage(
                  PImages.deliveredEmailIllustration,
                ),
                width: PHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // ...............Title & SubTitle..........
              Text(
                PText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              Text(
                email ??'' ,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              Text(
                PText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // ................Buttons.............
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: PImages.staticSuccessIllustration,
                      title: PText.yourAccountCreatedTitle,
                      subTitle: PText.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
                  child: const Text(PText.pContinue),
                ),
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(PText.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
