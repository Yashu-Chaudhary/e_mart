import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_mart/features/shop/screens/checkout/checkout.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(PSizes.defaultSpace),
        
        // -- Items in Cart
        child: PCartItems(),
      ),

      // --Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout Rs.256.0'),
        ),
      ),
    );
  }
}

