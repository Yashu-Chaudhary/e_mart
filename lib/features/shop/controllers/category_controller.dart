import 'package:e_mart/data/repositories/categories/categories_repository.dart';
import 'package:e_mart/features/shop/models/category_model.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // -- Load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // Fetch categories form data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Reove Loader
      isLoading.value = false;
    }
  }

  // -- Load selected categroy data

  // -- Get Category or Sub-Category Products.
}
