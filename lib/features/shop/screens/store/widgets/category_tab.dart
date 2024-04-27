import 'package:e_mart/common/widgets/brands/brand_show_case.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/models/category_model.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PCategoryTab extends StatelessWidget {
  const PCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(PSizes.defaultSpace),
            child: Column(
              children: [
                // ...........Brands.......
                const PBrandShowcase(
                  images: [
                    PImages.productImage1,
                    PImages.productImage2,
                    PImages.productImage3
                  ],
                ),
                const PBrandShowcase(
                  images: [
                    PImages.productImage1,
                    PImages.productImage2,
                    PImages.productImage3
                  ],
                ),

                // .............Products........
                PSectionHeading(
                  title: 'You might like',
                  onPressed: () {},
                ),
                const SizedBox(height: PSizes.spaceBtwItems),

                PGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => PProductCardVertical(product: ProductModel.empty(),)),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ]);
  }
}
