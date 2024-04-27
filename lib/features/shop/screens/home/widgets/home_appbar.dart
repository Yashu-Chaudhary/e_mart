import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/products/cart_menu_icon.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/common/widgets/shimmers/shimmer.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PHomeAppBar extends StatelessWidget {
  const PHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
            Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const PShimmerEffect(width: 80, height: 15);
                    } else {
                    return Text(
                      controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: PColors.white),
                    );
                }
  }),
          ],
        ),
        actions: [
          PCartCounterIcon(
            iconColor: PColors.white,
            onPressed: () {},
          ),
        ]);
  }
}
