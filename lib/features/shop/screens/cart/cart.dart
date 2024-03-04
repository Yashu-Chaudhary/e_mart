import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_mart/common/widgets/products/cart/cart_meanu_icon.dart';
import 'package:e_mart/common/widgets/texts/product_price_text.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        // -- Items in Cart
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          itemCount: 10,
          itemBuilder: (_, index) => const Column(
            children: [
              // --------Cart Item-------
              PCartItem(),
              SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // -------Add Remove Buttom Row with total Price--------
              Row(
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
                  
                  PProductPriceText(price: '256')
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout Rs.256.0'),
        ),
      ),
    );
  }
}
