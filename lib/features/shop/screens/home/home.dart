import 'package:e_mart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/controllers/product/product_controller.dart';
import 'package:e_mart/features/shop/screens/all_products/all_products.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_mart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // .........Header...........

            const PPrimartHeaderContainer(
              child: Column(
                children: [
                  // ............Appbar.......

                  PHomeAppBar(),
                  SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),

                  // .............Searchbar................

                  PSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),

                  // ..............Categories ...........

                  Padding(
                    padding: EdgeInsets.only(left: PSizes.defaultSpace),
                    child: Column(
                      children: [
                        // ............Heading...........

                        PSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),

                        // ..............Categories...............

                        PHomeCategories()
                      ],
                    ),
                  ),

                  SizedBox(
                    height: PSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            // ................Body..................

            Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),

              child: Column(children: [
                // ......................Promo Slider..................
                const PPromoSlider(),
                const SizedBox(height: PSizes.spaceBtwSections),

                // ..............Heading...............

                PSectionHeading(
                  title: 'Popular Products',
                  onPressed: () => Get.to(() => const AllProducts()),
                ),
                const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),

                // ...................Popular Products.............
                Obx(() {
                  if (controller.isLoading.value) {
                    return const PVerticalProductShimmer();
                  }
                  if (controller.featuredProducts.isEmpty) {
                    return Center(
                        child: Text('no Data Found!',
                            style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return PGridLayout(
                    itemCount: controller.featuredProducts.length,
                    itemBuilder: (_, index) => PProductCardVertical(
                        product: controller.featuredProducts[index]),
                  );
                }),
              ]),
              // .............
            ),
          ],
        ),
      ),
    );
  }
}
