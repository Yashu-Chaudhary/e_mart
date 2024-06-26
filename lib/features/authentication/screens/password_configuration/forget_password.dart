import 'package:e_mart/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ................Headings.................
            Text(
              PText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
            Text(
              PText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections * 2,
            ),

            // ................Text Field.................
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: PValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: PText.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),

            // .................Submit Button...............
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()  => controller.sendPasswordResetEmail(),
                child: const Text(PText.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
