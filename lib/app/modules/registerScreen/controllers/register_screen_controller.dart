import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  final count = 0.obs;
  final showPass = false.obs;
  ChangeEye() => showPass.toggle();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
