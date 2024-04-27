import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/features/shop/screens/product_details/widgets/bottom_add_to_card_widget.dart';
import 'package:e_mart/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_mart/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_mart/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_mart/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:e_mart/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const PBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -----------------Product Image Slider--------------
             PProductImageSlider(product: product),

            // ----------------------Product Details...............
            Padding(
              padding: const EdgeInsets.only(
                right: PSizes.defaultSpace,
                left: PSizes.defaultSpace,
                bottom: PSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // ---------Rating & Share---------
                  const PRatingAndshare(),

                  // ---------Price, Title, Stack, & Brand------------
                   PProductMetaData(product: product),

                  // ----------Attributes-----------
                  const PProductAttributes(),
                  const SizedBox(height: PSizes.spaceBtwSections),

                  // ------------Checkout Button-----------
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout'),
                      )),

                  // ----------Description---------
                  const PSectionHeading(title: 'Description'),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'This is a product description for White Nike Sleeve less vest. There are more things that can be aded but i am just practicing and nothing else. ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // ------------Reviews--------
                  const Divider(),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PSectionHeading(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: PSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
