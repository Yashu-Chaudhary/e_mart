import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  // Variables
  RxString selectedProductImage = ''.obs;

  // --Get all images from product ans variations
  List<String> getAllProductImages(ProductModel product) {
    // use set to add unique images only
    Set<String> images = {};

    // Load thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Get all image from the Product Model if not null.
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the product variations if not null.
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // -- show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: PSizes.defaultSpace * 2,
                        horizontal: PSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: PSizes.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
