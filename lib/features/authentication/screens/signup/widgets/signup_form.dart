import 'package:e_mart/common/widgets/login_signup/form_divider.dart';
import 'package:e_mart/common/widgets/login_signup/social_buttons.dart';
import 'package:e_mart/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_mart/features/authentication/screens/signup/widgets/terms_conditons_checkbox.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            // ........firstname & lastname..........
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        PValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: PText.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: PSizes.spaceBtwInputfields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        PValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: PText.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields,
            ),

            // ..................Username.............
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  PValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: PText.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields,
            ),

            // ..................Email................
            TextFormField(
              controller: controller.email,
              validator: (value) => PValidator.validateEmail(value),
              decoration: const InputDecoration(
                  labelText: PText.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields,
            ),
            // ..................Phone Number..........
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => PValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                  labelText: PText.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputfields,
            ),
            // .................Password................
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => PValidator.validatePassword(value),
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
              height: PSizes.spaceBtwInputfields,
            ),
            // .................Terms & Conditions CheckBox......
            const PTermsAndConditionCheckbox(),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            // ..................Sign Up Button.................
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(PText.createAccount),
              ),
            ),
            const SizedBox(height: PSizes.spaceBtwItems),

            // ..................Divider...............
            PFormDivider(dividerText: PText.orSignUpWith.capitalize!),
            const SizedBox(height: PSizes.spaceBtwItems),


            // .................Social Buttons...........
            const PSocialButtons(),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
          ],
        ));
  }
}
