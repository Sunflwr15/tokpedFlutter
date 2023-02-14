import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSliderController extends GetxController {
  //TODO: Implement CreateSliderController

  final count = 0.obs;
  final aktifasi = true.obs;
  changeActivation() => aktifasi.toggle();

  TextEditingController gambarSlider = TextEditingController();
  TextEditingController deskripsiSlider = TextEditingController();
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
