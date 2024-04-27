import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/firebase_storage_service.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:e_mart/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  // Get limited featured productrs
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(1)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // upload dummy data to cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // uplod all the products along with their images
      final storage = Get.put(PFirebaseStorageService());

      // loop through each product
      for (var product in products) {
        // Get image data link from assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign url to product.thumbnail attribute
        product.thumbnail = url;

        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // assign url to  product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from locadl assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // upload image adn get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Assing URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
