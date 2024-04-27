import 'package:e_mart/common/widgets/shimmers/shimmer.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PCategoryShimmer extends StatelessWidget {
  const PCategoryShimmer({super.key, this.itemCount = 8});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              PShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: PSizes.spaceBtwItems/2),

              // Text
              PShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
