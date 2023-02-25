import 'package:get/get.dart';

import '../controllers/product_data_controller.dart';

class ProductDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDataController>(
      () => ProductDataController(),
    );
  }
}
