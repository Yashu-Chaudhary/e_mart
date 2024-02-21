import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/common/widgets/texts/p_brand_title_text_with_verified_icon.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

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
