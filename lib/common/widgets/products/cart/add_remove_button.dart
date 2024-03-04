import 'package:e_mart/common/widgets/icons/p_circular_icon.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PProductQuantityWithAddRemooveButton extends StatelessWidget {
  const PProductQuantityWithAddRemooveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: PSizes.md,
          color: PHelperFunctions.isDarkMode(context)
              ? PColors.white
              : PColors.black,
          backgroundColor: PHelperFunctions.isDarkMode(context)
              ? PColors.darkerGrey
              : PColors.light,
        ),
        const SizedBox(
          width: PSizes.spaceBtwSections,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: PSizes.spaceBtwSections,
        ),
        const PCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: PSizes.md,
          color: PColors.white,
          backgroundColor: PColors.primary,
        ),
      ],
    );
  }
}
