// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';

class SliderController extends GetxController {
  String url = "";
  File? path;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addData(bool aktifSlider, String deskSlider, String gambarSlider) async {
    CollectionReference slider = firestore.collection('slider');

    final sliderData = {
      "active_slider": aktifSlider,
      "deskripsi_slider": deskSlider,
      "gambar_slider": gambarSlider
    };

// Add a new document with a generated ID
    try {
      await slider.add(sliderData).then((DocumentReference doc) {
        print('DocumentSnapshot added with ID: ${doc.id}');
        Get.defaultDialog(title: 'Alert', middleText: 'berhasil menambah data');
        Get.offNamed(Routes.SLIDER_DATA);
      });
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menambah data');
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference slider = firestore.collection('slider');

    return await slider.get();
  }

  updateData(String id, bool activeSlider, String deskSlider,
      String gambarSlider) async {
    try {
      final sliderData = {
        "active_slider": activeSlider,
        "deskripsi_slider": deskSlider,
        "gambar_slider": gambarSlider
      };

      DocumentReference Slider = firestore.collection('slider').doc(id);
      await Slider.update(sliderData);

      Get.defaultDialog(title: 'Alert', middleText: 'berhasil menupdate data');
      // Get.offNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menupdate data');
      print(e);
    }
  }

  deleteData(String id) async {
    try {
      DocumentReference Slider = firestore.collection('slider').doc(id);
      await Slider.delete();
      Get.defaultDialog(title: 'Alert', middleText: 'berhasil mendelete data');
      return Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal mendelete data');
      print(e);
    }
  }

  addPhoto() async {
    // var result = null;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      url = namaFile;
      try {
        await storage.ref("${namaFile}").putFile(file);
        final data = await storage.ref("${namaFile}").getDownloadURL();
        url = data;
        print("isi data ${data}");
        return url;
      } catch (e) {}
    } else {
      print("Tidak mengirim file!");
    }
  }
}
