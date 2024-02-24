import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(PImages.user),
                ),
                const SizedBox(width: PSizes.spaceBtwItems),
                Text('Yashu Chaudary',
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems),

        // -------------Review----------
        Row(
          children: [
            const PRatingBarIndicator(rating: 4),
            const SizedBox(width: PSizes.spaceBtwItems),
            Text('01 Jan, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: PSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PColors.primary),
        ),
        const SizedBox(height: PSizes.spaceBtwItems),

        // -----------------Company Review-----------
        PRoundedContainer(
          backgroundColor: dark ? PColors.darkerGrey : PColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(PSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E-Mart', style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Jan, 2024', style: Theme.of(context).textTheme.bodyMedium),

                  ],
                ),
                const SizedBox(height: PSizes.spaceBtwItems),
                const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PColors.primary),
        ),
        
              ],
            ),
          ),
        ),
        const SizedBox(height: PSizes.spaceBtwSections),
      ],
    );
  }
}
