import 'package:e_mart/features/authentication/screens/signup/widgets/signup.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
        child: Column(
          children: [
            // ........Email......
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: PText.email),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: PText.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields / 2,
            ),

            // ...........Remember Me & Forget Password..............
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ...............Remember Me................
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(PText.rememberMe),
                  ],
                ),

                // ...............Forget Password.............
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    PText.forgetPassword,
                    // style: TextStyle(fontSize: ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),

            // ...................Sign In Button............
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(PText.signIn),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            // ...................Create Account Button............
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(PText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
