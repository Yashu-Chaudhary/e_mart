import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/products/cart/coupon_widget.dart';
import 'package:e_mart/common/widgets/succiss_screen/success_screen.dart';
import 'package:e_mart/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_mart/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_mart/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_mart/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              // -- Items in Cart
              const PCartItems(
                showAddRemeoveButtons: false,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // ----------Coupon TextField--------
              const PCouponCode(),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              /// ------------Billing Section-------
              PRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(PSizes.md),
                backgroundColor: dark ? PColors.black : PColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    PBillingAmountSection(),
                    SizedBox(height: PSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: PSizes.spaceBtwItems),

                    /// Payment Methods
                    PBillingPaymentSection(),
                    SizedBox(height: PSizes.spaceBtwItems),

                    /// Address
                    PBillingaddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: PImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout Rs.256.0'),
        ),
      ),
    );
  }
}
