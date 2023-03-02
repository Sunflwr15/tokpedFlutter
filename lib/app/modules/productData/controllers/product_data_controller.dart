import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';

class ProductDataController extends GetxController {
  //TODO: Implement ProductDataController

  final count = 0.obs;
  final productC = ProductController();

  @override
  void onInit() {
    productC.filterData();
    super.onInit();
  }

  @override
  void onReady() {
    ProductController().filterData();

    super.onReady();
  }

  @override
  void onClose() {
    ProductController().filterData();

    super.onClose();
  }

  void increment() => count.value++;
}
