import 'package:e_mart/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_mart/common/widgets/products/cart/cart_meanu_icon.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PCartItems extends StatelessWidget {
  const PCartItems({
    super.key, this.showAddRemeoveButtons= true,
  });
  final bool showAddRemeoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: PSizes.spaceBtwSections,
      ),
      itemCount: 4,
      itemBuilder: (_, index) =>  Column(
        children: [
          // --------Cart Item-------
          const PCartItem(),
          if (showAddRemeoveButtons) const SizedBox(
            height: PSizes.spaceBtwSections,
          ),

          // -------Add Remove Buttom Row with total Price--------
          if (showAddRemeoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // -----Extra Space---------
                  SizedBox(width: 70),

                  // ----------Add Remove buttons----------
                  PProductQuantityWithAddRemooveButton(),
                ],
              ),

              // -- Poduct Totla Price
              PProductPriceText(price: '256')
            ],
          ),
        ],
      ),
    );
  }
}
