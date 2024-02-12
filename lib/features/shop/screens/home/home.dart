import 'package:e_mart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:e_mart/common/widgets/products.cart/texts/section_heading.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          // .........Header...........
          PPrimartHeaderContainer(
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

                // ..............Categories & Heading...........
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
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
