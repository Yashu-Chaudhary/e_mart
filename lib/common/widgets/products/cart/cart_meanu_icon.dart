import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/texts/product_title_text.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PCartItem extends StatelessWidget {
  const PCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PRoundedImage(
          imageUrl: PImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(PSizes.sm),
          backgroundColor: PHelperFunctions.isDarkMode(context)
              ? PColors.darkerGrey
              : PColors.light,
        ),
        const SizedBox(width: PSizes.spaceBtwItems),
    
        // ------------------Title, Price, & Size----------------
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PBrandTitleWithVerifiedIcon(title: 'Nike'),
          
              const Flexible(
                child: PProductTitleText(
                  title: 'White Sports shoes fdfsdfddddddddddddddddd',
                  maxLines: 1,
                ),
              ),
              // ------------------Attributes----------
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 10 ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
