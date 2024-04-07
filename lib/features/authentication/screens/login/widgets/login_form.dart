import 'package:e_mart/features/authentication/controllers/login/login_controller.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_mart/features/authentication/screens/signup/signup.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
        child: Column(
          children: [
            // ........Email......
            TextFormField(
              controller: controller.email,
              validator: (value) => PValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: PText.email),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => PValidator.validateEmptyText("Password Must be Entered",value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: PText.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
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
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(PText.rememberMe),
                  ],
                ),

                // ...............Forget Password.............
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(
                    PText.forgetPassword,
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
                onPressed: () => controller.emailAndPasswordSignIn(),
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
