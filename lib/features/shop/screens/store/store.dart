import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/appbar/tabbar.dart';
import 'package:e_mart/common/widgets/brands/brand_card.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/cart_menu_icon.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/features/shop/controllers/category_controller.dart';
import 'package:e_mart/features/shop/screens/brand/all_brands.dart';
import 'package:e_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final bool dark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        // ........AppBar.............
        appBar: PAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              PCartCounterIcon(onPressed: () {}),
            ]),
        body: NestedScrollView(
          // ................Header  ................
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? PColors.black : PColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(PSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    // ..............Search Bar............
                    children: [
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      const PSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),

                      // ..............Feature Brands..........
                      PSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),

                      const SizedBox(
                        height: PSizes.spaceBtwItems / 1.5,
                      ),

                      // ......................Brand Grid............
                      PGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const PBrandCard(
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // ..........Tabs.......
                bottom: PTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                ),
              ),
            ];
          },

          // ..........Body..........
          body:  TabBarView(
            children: 
              categories.map((category) => PCategoryTab(category: category,)).toList()
            
          ),
        ),
      ),
    );
  }
}
