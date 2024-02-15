import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/appbar/tabbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/cart_menu_icon.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        // ........AppBar.............
        appBar: PAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            PCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
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
                        onPressed: () {},
                      ),

                      const SizedBox(
                        height: PSizes.spaceBtwItems / 1.5,
                      ),

                      // ......................Brand Grid............
                      PGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const PBrandCard(
                            showBorder: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // ..........Tabs.......
                bottom: const PTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Consmetics')),
                    Tab(child: Text('Kids'))
                  ],
                ),
              ),
            ];
          },
          // ..........Body..........
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(PSizes.defaultSpace),
                child: Column(
                  children: [
                    // ...........Brands.......
                    PRoundedContainer(
                      showBorder: true,
                      borderColor: PColors.darkGrey,
                      backgroundColor: Colors.transparent,
                      margin:
                          const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
                      child: Column(
                        children: [
                          // ........Brand with Product Count........
                          const PBrandCard(showBorder: false),

                          // .........Brand Top 3 Images...........
                          Row(
                            children: [
                              PRoundedContainer(
                                height: 100,
                                backgroundColor:
                                    dark ? PColors.darkerGrey : PColors.light,
                                margin: const EdgeInsets.all(PSizes.spaceBtwItems),
                              )
                            ],
                          )
                        ],
                      ),
                    )

                    // .............Products........
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PBrandCard extends StatelessWidget {
  const PBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool dark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      // .............Container Design...........
      child: PRoundedContainer(
        padding: const EdgeInsets.all(PSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // .........Icon.........
            Flexible(
              child: PCircularImage(
                image: PImages.clothIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? PColors.white : PColors.black,
              ),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            ),

            // ..............Text........
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '20 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
