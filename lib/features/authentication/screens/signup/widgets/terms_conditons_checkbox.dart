import 'package:e_mart/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PTermsAndConditionCheckbox extends StatelessWidget {
  const PTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = PHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(
              () => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (vlaue) => controller.privacyPolicy.value =
                      !controller.privacyPolicy.value),
            )),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '${PText.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: '${PText.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? PColors.white : PColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? PColors.white : PColors.primary),
            ),
            TextSpan(
              text: '${PText.and} ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
                text: '${PText.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? PColors.white : PColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? PColors.white : PColors.primary)),
          ]),
        ),
      ],
    );
  }
}
