import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/features/shop/models/banner_model.dart';
import 'package:e_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:e_mart/utils/exceptions/format_exceptions.dart';
import 'package:e_mart/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const PFormatExcepton();
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Bnners.';
    }
  }

  // Upload Banners to the Cloud Firebase
}
