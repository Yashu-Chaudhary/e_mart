import 'package:e_mart/common/styles/shadows.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/icons/p_circular_icon.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/common/widgets/texts/product_title_text.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    // Container with side padding, color, edges, radius, and shadow.
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [PShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(PSizes.productImageRadius),
            color: dark ? PColors.darkerGrey : PColors.white),
        child: Column(
          children: [
            // .............Thumbnail, Wishlist Button, Discount Tag.........
            PRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(PSizes.sm),
              backgroundColor: dark ? PColors.dark : PColors.light,
              child: Stack(
                children: [
                  // ..................Thumbnail Image...................
                  const PRoundedImage(
                    imageUrl: PImages.productImage1,
                    applyImageRadius: true,
                  ),

                  // ...............Sale Tag..............
                  Positioned(
                    top: 12,
                    child: PRoundedContainer(
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
                  ),

                  // ...............Favourite Icon Button.........
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: PCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),

            // .............Details...............
            const Padding(
              padding: EdgeInsets.only(left: PSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PProductTitleText(
                    title: 'Black And White Nike AIr Shoes',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  PBrandTitleWithVerifiedIcon(title: 'Nike',),
                ],
              ),
            ),
            const Spacer(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // .......Price.....
                const Padding(
                  padding: EdgeInsets.only(left: PSizes.sm),
                  child: PProductPriceText(price: '1777.7')),
                // ..........Add to Cart Button............
                Container(
                  decoration: const BoxDecoration(
                    color: PColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(PSizes.cardRadiusMg),
                      bottomRight: Radius.circular(PSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: PSizes.iconLg * 1.2,
                    height: PSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: PColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

