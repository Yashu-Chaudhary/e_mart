
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
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: PSizes.spaceBtwItems),
        child: Column(
          children: [
            // ..............Circular Icon............
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(PSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? PColors.black : PColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? PColors.light : PColors.dark,
                ),
              ),
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
