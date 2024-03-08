import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PBillingAmountSection extends StatelessWidget {
  const PBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs 1777.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs 35', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs 12.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs 35', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
