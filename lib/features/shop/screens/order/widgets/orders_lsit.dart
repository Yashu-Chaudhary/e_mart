import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class POrderListItems extends StatelessWidget {
  const POrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      separatorBuilder: (_,__) =>
          const SizedBox(height: PSizes.spaceBtwItems),
      itemBuilder: (_, index) => PRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(PSizes.md),
        backgroundColor: dark ? PColors.dark : PColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ---Row 1
            Row(
              children: [
                /// ---1-Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: PSizes.spaceBtwItems / 2),

                //  2- Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: PColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2024',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// 3- Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: PSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            /// -----Row 2--------
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// ---1-Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: PSizes.spaceBtwItems / 2),

                      //  2- Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// ---1-Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: PSizes.spaceBtwItems / 2),

                      //  2- Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
