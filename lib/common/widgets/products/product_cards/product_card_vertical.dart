import 'package:e_mart/common/styles/shadows.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/icons/p_circular_icon.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: PSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PProductTitleText(
                    title: 'Black And White Nike AIr Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: PSizes.xs,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: PColors.primary,
                        size: PSizes.iconXs,
                      ),
                    ],
                  ),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // .......Price.....
                      const PProductPriceText(price: '77.7'),
                      // ..........Add to Cart Button............
                      Container(
                        decoration: const BoxDecoration(
                          color: PColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(PSizes.cardRadiusMg),
                            bottomRight:
                                Radius.circular(PSizes.productImageRadius),
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
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 