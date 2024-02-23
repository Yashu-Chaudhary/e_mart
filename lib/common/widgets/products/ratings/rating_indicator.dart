import 'package:e_mart/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class PRatingBarIndicator extends StatelessWidget {
  const PRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) => const Icon(
        Iconsax.star1,
        color: PColors.primary,
      ),
      rating: rating,
      itemSize: 20,
    );
  }
}
