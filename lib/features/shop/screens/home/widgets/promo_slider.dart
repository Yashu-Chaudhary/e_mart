import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/features/shop/controllers/home_controller.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PPromoSlider extends StatelessWidget {
  const PPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)),
        items: banners
            .map((url) => PRoundedImage(imageUrl: url))
            .toList(),
      ),
      const SizedBox(
        height: PSizes.spaceBtwItems,
      ),
      Center(
        child: Obx(
          () => Row(mainAxisSize: MainAxisSize.min, children: [
            for (int i = 0; i < banners.length; i++)
              PCircularContainer(
                height: 4,
                width: 20,
                margin: const EdgeInsets.only(right: 10),
                backgroundColor: controller.carousalCurrentIndex.value == i
                    ? PColors.primary
                    : PColors.grey,
              )
          ]),
        ),
      )
    ]);
  }
}
