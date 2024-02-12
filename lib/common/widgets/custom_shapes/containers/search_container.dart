import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PSearchContainer extends StatelessWidget {
  const PSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PSizes.defaultSpace),
        child: Container(
          width: PDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(PSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? PColors.dark
                      : PColors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(PSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: PColors.grey) : null),
          child: Row(
            children: [
              const Icon(
                Iconsax.search_normal,
                color: PColors.darkerGrey,
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
