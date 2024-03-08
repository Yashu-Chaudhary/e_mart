import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PBillingaddressSection extends StatelessWidget {
  const PBillingaddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Yashu Chaudhary', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: PSizes.spaceBtwItems /2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: PSizes.spaceBtwItems),
            Text('+91 7906277120', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: PSizes.spaceBtwItems),
            Text('Tajpur Tashinga Sadabad Hatharas UP', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),
          ],
        ),
      ],
    );
  }
}
