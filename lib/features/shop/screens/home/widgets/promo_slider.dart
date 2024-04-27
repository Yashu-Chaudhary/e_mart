import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/common/widgets/shimmers/shimmer.dart';
import 'package:e_mart/features/shop/controllers/banner_controller.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PPromoSlider extends StatelessWidget {
  const PPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Loader
      if (controller.isLoading.value) {
        return const PShimmerEffect(
          width: double.infinity,
          height: 190,
        );
      }

      // No Data Found
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found!'),
        );
      } else {
        return Column(children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index)),
            items: controller.banners
                .map((banner) => PRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(mainAxisSize: MainAxisSize.min, children: [
                for (int i = 0; i < controller.banners.length; i++)
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
    });
  }
}
