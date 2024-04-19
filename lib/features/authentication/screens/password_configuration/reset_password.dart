import 'package:e_mart/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(children: [
            // ...................Image................
            Image(
              image: const AssetImage(PImages.deliveredEmailIllustration),
              width: PHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),

            // ...............Title & SubTitle..........
            Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            Text(
              PText.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            

            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            Text(
              PText.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),

            // ...................Button................
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(()=> const LoginScreen()),
                child: const Text(PText.done),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text(PText.resendEmail),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
