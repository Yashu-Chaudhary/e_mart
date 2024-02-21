import 'package:e_mart/common/widgets/brands/brand_card.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PBrandShowcase extends StatelessWidget {
  const PBrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return PRoundedContainer(
      showBorder: true,
      borderColor: PColors.darkGrey,
      padding: const EdgeInsets.all(PSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
      child: Column(
        children: [
          // ........Brand with Product Count........
          const PBrandCard(showBorder: false),

          // .........Brand Top 3 product Images...........
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final bool dark = PHelperFunctions.isDarkMode(context);
  return Expanded(
    child: PRoundedContainer(
      height: 100,
      backgroundColor: dark ? PColors.darkerGrey : PColors.light,
      margin: const EdgeInsets.all(PSizes.spaceBtwItems),
      padding: const EdgeInsets.all(PSizes.md),
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}

