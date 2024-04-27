import 'package:e_mart/data/repositories/banners/banner_repository.dart';
import 'package:e_mart/features/shop/models/banner_model.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  // Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Reove Loader
      isLoading.value = false;
    }
  }
}
