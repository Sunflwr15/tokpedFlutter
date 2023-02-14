import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneScreenController extends GetxController {
  //TODO: Implement PhoneScreenController

  final count = 0.obs;
  TextEditingController phoneNumber = TextEditingController();
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
