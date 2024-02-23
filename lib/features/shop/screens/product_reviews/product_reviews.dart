import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_mart/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_mart/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------appbar-------------
      appBar: const PAppBar(
        title: Text('Reviews & Ratings'),
      ),
      // -----Body---------------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: PSizes.spaceBtwItems),
              // ----overall Product Ratings------
              const POverallProductRating(),

              const PRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                '12,1611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: PSizes.spaceBtwSections),

              // --------User Reviews List------------
              UserReviewCard(),
              UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}
