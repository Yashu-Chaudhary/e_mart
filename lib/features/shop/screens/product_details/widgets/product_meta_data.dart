import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/common/widgets/texts/product_title_text.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PProductMetaData extends StatelessWidget {
  const PProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------------Price & Sale Price---------------
        Row(
          children: [
            // ------------------Sale Tag------------------
            PRoundedContainer(
              radius: PSizes.sm,
              backgroundColor: PColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: PSizes.sm, vertical: PSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: PColors.black),
              ),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems,
            ),

            // Price
            Text(
              'Rs. 250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: PSizes.spaceBtwItems),
            const PProductPriceText(
              price: '198',
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 1.5),
        // Title

        const PProductTitleText(title: 'White Nike Sports Shoes'),
        const SizedBox(height: PSizes.spaceBtwItems / 1.5),
        // Stack Status

        Row(
          children: [
            const PProductTitleText(title: 'Status'),
            const SizedBox(width: PSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 1.5),

        // Brand
         Row(
          children: [
            PCircularImage(
              image: PImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? PColors.white:PColors.black,
              ),
            const PBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
