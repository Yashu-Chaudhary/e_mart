import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBingings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
