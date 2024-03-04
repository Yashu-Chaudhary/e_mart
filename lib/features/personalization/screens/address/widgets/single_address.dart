import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PSingleAddress extends StatelessWidget {
  const PSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return PRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(PSizes.md),
      backgroundColor: selectedAddress
          ? PColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? PColors.darkerGrey
              : PColors.grey,
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? PColors.light
                      : PColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yashu Chaudhary',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,

              ),
              const SizedBox(height: PSizes.sm / 2),
              const Text('+91 7906277120', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: PSizes.sm / 2),
              const Text(' Local Colony Rd, 53 A Ganesh Puram Colony, Bairaj Road, near लक्ष्मी गार्डन, Gokul, Mathura, Uttar Pradesh 281006',softWrap: true,),


            ],
          )
        ],
      ),
    );
  }
}
