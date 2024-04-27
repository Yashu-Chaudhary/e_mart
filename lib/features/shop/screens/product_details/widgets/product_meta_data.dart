import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/common/widgets/texts/product_title_text.dart';
import 'package:e_mart/features/shop/controllers/product/product_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PProductMetaData extends StatelessWidget {
  const PProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercentage%',
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
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: PSizes.spaceBtwItems),
            PProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 1.5),
        // Title

        PProductTitleText(title: product.title),
        const SizedBox(height: PSizes.spaceBtwItems / 1.5),


        // Stack Status
        Row(
          children: [
            const PProductTitleText(title: 'Status'),
            const SizedBox(width: PSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 1.5),

        // Brand
        Row(
          children: [
            PCircularImage(
              image: product.brand != null ? product.brand!.image:'',
              width: 32,
              height: 32,
              overlayColor: dark ? PColors.white : PColors.black,
            ),
            PBrandTitleWithVerifiedIcon(
              title: product.brand !=null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
