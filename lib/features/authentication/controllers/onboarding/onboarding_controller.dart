import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // ............Variables..............
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // .......Update Current Index when Page Scroll...........
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // .............Jump to the specific dot selected page......
  void doNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // ........Update Current Index & jump to next page..........
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('==============Get Storage Next Button ====================');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);

      if (kDebugMode) {
        print('==============Get Storage Next Button ====================');
        print(storage.read('IsFirstTime'));
      }
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // ........Update Currnt Index & jump to the last Page..........
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpTo(2);
  }
}
