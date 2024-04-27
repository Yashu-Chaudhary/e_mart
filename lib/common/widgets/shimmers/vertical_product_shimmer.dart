import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/shimmers/shimmer.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PVerticalProductShimmer extends StatelessWidget {
  const PVerticalProductShimmer({super.key, this.itemCount =4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return PGridLayout(itemCount: itemCount, itemBuilder: (_,__) => const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          PShimmerEffect(width: 180, height: 180),
          SizedBox(height: PSizes.spaceBtwItems),

          // Text
          PShimmerEffect(width: 160, height: 15),
          SizedBox(height: PSizes.spaceBtwItems/2),
          PShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
