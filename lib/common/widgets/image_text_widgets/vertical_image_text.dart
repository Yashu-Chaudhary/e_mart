import 'package:e_mart/common/widgets/images/p_circular_image.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PVericalimageText extends StatelessWidget {
  const PVericalimageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = PColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: PSizes.spaceBtwItems),
        child: Column(
          children: [
            // ..............Circular Icon............
            PCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: PSizes.sm * 0.7,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: PHelperFunctions.isDarkMode(context)
                  ? PColors.light
                  : PColors.dark,
            ),
            // ...........Text...............
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
