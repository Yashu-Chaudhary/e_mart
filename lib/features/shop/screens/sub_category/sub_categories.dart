import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PAppBar(title: Text('Sports shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              /// ---------Banner--------
              const PRoundedImage(
                width: double.infinity,
                imageUrl: PImages.promoBanner4,
                applyImageRadius: true,
              ),
              const SizedBox(height: PSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  PSectionHeading(
                    title: 'Sports sirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: PSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            const PProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
