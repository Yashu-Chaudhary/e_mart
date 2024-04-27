import 'package:e_mart/common/styles/shadows.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/icons/p_circular_icon.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/common/widgets/texts/product_title_text.dart';
import 'package:e_mart/features/shop/controllers/product/product_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/features/shop/screens/product_details/product_detail.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = PHelperFunctions.isDarkMode(context);

    // Container with side padding, color, edges, radius, and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
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
              width: 180,
              padding: const EdgeInsets.all(PSizes.sm),
              backgroundColor: dark ? PColors.dark : PColors.light,
              child: Stack(
                children: [
                  // ..................Thumbnail Image...................
                  Center(
                    child: PRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
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
                        '$salePercentage%',
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
                  PProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  PBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // .......Price.....
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                            padding: const EdgeInsets.only(left: PSizes.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            )),

                      // price, show sale price as main price if sale exist.
                      Padding(
                          padding: const EdgeInsets.only(left: PSizes.sm),
                          child: PProductPriceText(
                              price: controller.getProductPrice(product))),
                    ],
                  ),
                ),
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
