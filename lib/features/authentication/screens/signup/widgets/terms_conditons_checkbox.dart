import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PTermsAndConditionCheckbox extends StatelessWidget {
  const PTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (vlaue) {})),
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
            // TextSpan(
            //     text: '${PText.termsOfUse} ',
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyMedium!
            //         .apply(
            //             color: dark
            //                 ? PColors.white
            //                 : PColors.primary,
            //             decoration: TextDecoration.underline,
            //             decorationColor: dark
            //                 ? PColors.white
            //                 : PColors.primary)),
          ]),
        ),
      ],
    );
  }
}
