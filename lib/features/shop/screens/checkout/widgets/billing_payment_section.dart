import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PBillingPaymentSection extends StatelessWidget {
  const PBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        PSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 2),
        PRoundedContainer(
          width: 60,
          height: 35,
          backgroundColor: dark ? PColors.light : PColors.white,
          padding: const EdgeInsets.all(PSizes.sm),
          child: const Image(image: AssetImage(PImages.paypal), fit: BoxFit.contain),
        ),
        const SizedBox(width: PSizes.spaceBtwItems / 2),
        Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
