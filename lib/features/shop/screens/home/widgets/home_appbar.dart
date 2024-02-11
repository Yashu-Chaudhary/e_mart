import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class PHomeAppBar extends StatelessWidget {
  const PHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: PColors.grey),
            ),
            Text(
              PText.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: PColors.white),
            ),
          ],
        ),
        actions: [
          PCartCounterIcon(iconColor: PColors.white, onPressed: (){},),
        ]);
  }
}

