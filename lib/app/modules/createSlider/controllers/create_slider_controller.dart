import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/slider_controller.dart';

class CreateSliderController extends GetxController {
  //TODO: Implement CreateSliderController

  final count = 0.obs;
  final aktifasi = true.obs;
  changeActivation() => aktifasi.toggle();

  TextEditingController gambarSlider = TextEditingController();
  TextEditingController deskripsiSlider = TextEditingController();
  @override
  uploadGambar() async {
    String data = await SliderController().addPhoto();
    gambarSlider.text = data;
    print("Isi dari data ${data}");
  }

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
