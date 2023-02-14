import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateSliderController extends GetxController {
  //TODO: Implement UpdateSliderController

  final count = 0.obs;
  final aktifasi = true.obs;
  final data = Get.arguments;

  changeActivation() => aktifasi.toggle();
  TextEditingController gambarSlider = TextEditingController();
  TextEditingController deskripsiSlider = TextEditingController();

  @override
  void onInit() {
    gambarSlider.text = (data.data() as Map<String, dynamic>)['gambar_slider'];
    deskripsiSlider.text =
        (data.data() as Map<String, dynamic>)['deskripsi_slider'];
    aktifasi.value = (data.data() as Map<String, dynamic>)['active_slider'];
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
