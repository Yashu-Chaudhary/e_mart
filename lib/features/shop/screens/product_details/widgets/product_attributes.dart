import 'package:e_mart/common/widgets/chips/choice_chip.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/common/widgets/texts/product_title_text.dart';
import 'package:e_mart/common/widgets/texts/section_heading.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PProductAttributes extends StatelessWidget {
  const PProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // -----------------------Selected attributes pricing & decription-------------
        PRoundedContainer(
          padding: const EdgeInsets.all(PSizes.md),
          backgroundColor: dark ? PColors.darkerGrey : PColors.grey,
          child: Column(
            children: [
              // -------------Title , price adn stack status------------------------
              Row(
                children: [
                  const PSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: PSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const PProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          // ------------Actual Price--------------
                          Text(
                            'Rs. 255',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: PSizes.spaceBtwItems),

                          // -------------------Sale Price--------------
                          const PProductPriceText(price: '20')
                        ],
                      ),

                      // ------------------Stack------------------------
                      Row(
                        children: [
                          const PProductTitleText(
                              title: 'Stack : ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // --------------------Variation Decription------------------------
              const PProductTitleText(
                title:
                    'This is the Description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: PSizes.spaceBtwItems / 2),

        // ------------------------Attributes------------------
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                PChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                PChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                PChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PSectionHeading(title: 'Size'),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                PChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                PChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                PChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
