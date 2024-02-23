import 'package:e_mart/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class POverallProductRating extends StatelessWidget {
  const POverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.9',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              PRatingProgressIndicator(text: '5', value: 1.0),
              PRatingProgressIndicator(text: '4', value: 0.8),
              PRatingProgressIndicator(text: '3', value: 0.6),
              PRatingProgressIndicator(text: '2', value: 0.4),
              PRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
