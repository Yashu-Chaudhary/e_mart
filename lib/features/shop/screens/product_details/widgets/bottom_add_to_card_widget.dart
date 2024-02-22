import 'package:e_mart/common/widgets/icons/p_circular_icon.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PBottomAddToCart extends StatelessWidget {
  const PBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: PSizes.defaultSpace, vertical: PSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? PColors.darkerGrey : PColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(PSizes.cardRadiusLg),
          topRight: Radius.circular(PSizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Row(
          children: [
             const PCircularIcon(icon: Iconsax.minus,
          backgroundColor: PColors.darkGrey,
          width: 40,
          height: 40,
          color: PColors.white,
          ),
          const SizedBox(width: PSizes.spaceBtwItems),
          Text('2', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: PSizes.spaceBtwItems),
          const PCircularIcon(icon: Iconsax.add,
          backgroundColor: PColors.black,
          width: 40,
          height: 40,
          color: PColors.white,
          ),
          ],
         ),
         ElevatedButton(
          onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(PSizes.md),
            backgroundColor: PColors.black,
            side: const BorderSide(color: PColors.black)
          ),
         child: const Text('Add to Cart'))
        ],
      ),
      
    );
  }
}
