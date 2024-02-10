import 'package:e_mart/common/widgets/login_signup/form_divider.dart';
import 'package:e_mart/common/widgets/login_signup/social_buttons.dart';
import 'package:e_mart/features/authentication/screens/signup/widgets/terms_conditons_checkbox.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Form(
        child: Column(
      children: [
        // ........firstname & lastname..........
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: PText.firstName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: PSizes.spaceBtwInputfields,
            ),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: PText.firstName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputfields,
        ),

        // ..................Username.............
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: PText.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputfields,
        ),

        // ..................Email................
        TextFormField(
          decoration: const InputDecoration(
              labelText: PText.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputfields,
        ),
        // ..................Phone Number..........
        TextFormField(
          decoration: const InputDecoration(
              labelText: PText.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(
          height: PSizes.spaceBtwInputfields,
        ),
        // .................Password................
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: PText.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
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
            onPressed: () {},
            child: const Text(PText.createAccount),
          ),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),

        // ..................Divider...............
        PFormDivider(dividerText: PText.orSignUpWith.capitalize!),

        // .................Social Buttons...........
        const PSocialButtons(),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
      ],
    ));
  }
}