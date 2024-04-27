import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_mart/common/widgets/icons/p_circular_icon.dart';
import 'package:e_mart/common/widgets/images/p_rounded_image.dart';
import 'package:e_mart/features/shop/controllers/product/images_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PProductImageSlider extends StatelessWidget {
  const PProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return PCurvedEdgeWidget(
      child: Container(
        color: dark ? PColors.darkerGrey : PColors.light,
        child: Stack(
          children: [
            // -------------------Main Large Image-------------
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(PSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: PColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            // -----------Image Slider------------------
            Positioned(
              right: 0,
              bottom: 30,
              left: PSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: PSizes.spaceBtwItems),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return PRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      backgroundColor: dark ? PColors.dark : PColors.white,
                      border: Border.all(color: imageSelected ?PColors.primary : Colors.transparent),
                      padding: const EdgeInsets.all(PSizes.sm),
                      imageUrl: images[index],
                      onPressed: () => controller.selectedProductImage.value = images[index],
                    );
                  }),
                ),
              ),
            ),

            // ---------------Appbar Icons------------
            const PAppBar(
              showBackArrow: true,
              actions: [
                PCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
