import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../../controllers/product_controller.dart';

class CreateProductController extends GetxController {
  //TODO: Implement CreateProductController

  final count = 0.obs;
  final status = true.obs;
  changeActivation() => status.toggle();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  final rate = Random().nextInt(5);
  TextEditingController stock = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController image = TextEditingController();
  final sold = Random().nextInt(50);
  TextEditingController store = TextEditingController();
  TextEditingController adress = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  uploadGambar() async {
    String data = await ProductController().addPhoto();
    image.text = data;
    print("Isi dari data ${data}");
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
