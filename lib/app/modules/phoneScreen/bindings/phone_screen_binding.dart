import 'package:get/get.dart';

import '../controllers/phone_screen_controller.dart';

class PhoneScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneScreenController>(
      () => PhoneScreenController(),
    );
  }
}
