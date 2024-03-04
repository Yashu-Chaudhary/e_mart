import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PCartCounterIcon extends StatelessWidget {
  const PCartCounterIcon({
    super.key,
    this.iconColor = PColors.white,
    required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
        onPressed: () => Get.to(() => const CartScreen()),
        icon: const Icon(
          Iconsax.shopping_bag,
          color: PColors.white,
        ),
      ),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: PColors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              '1',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: PColors.white, fontSizeFactor: 0.8),
            ),
          ),
        ),
      )
    ]);
  }
}
