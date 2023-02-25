// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names

// import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';

class ProductController extends GetxController {
  String url = "";
  File? path;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addData(
    String store,
    String title,
    String image,
    String description,
    int price,
    int discount,
    String address,
    int rate,
    int stock,
    int sold,
    bool status,
  ) async {
    CollectionReference product = firestore.collection('product');

    final productData = {
      // "active_product": aktifproduct,
      // "deskripsi_product": deskproduct,
      // "gambar_product": gambarproduct
      "store": store,
      "title": title,
      "image": image,
      "description": description,
      "price": price,
      "discount": discount,
      "address": address,
      "rate": rate,
      "stock": stock,
      "sold": sold,
      "status": status
    };

// Add a new document with a generated ID
    try {
      await product.add(productData).then((DocumentReference doc) {
        print('DocumentSnapshot added with ID: ${doc.id}');
        Get.defaultDialog(title: 'Alert', middleText: 'berhasil menambah data');
        Get.offNamed(Routes.PRODUCT_DATA);
      });
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menambah data');
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference produk = firestore.collection('product');

    return await produk.get();
  }

  updateData(
    String id,
    String store,
    String title,
    String image,
    String description,
    int price,
    int discount,
    String address,
    int rate,
    int stock,
    int sold,
    bool status,
  ) async {
    try {
      final productData = {
        "store": store,
        "title": title,
        "image": image,
        "description": description,
        "price": price,
        "discount": discount,
        "address": address,
        "rate": rate,
        "stock": stock,
        "sold": sold,
        "status": status
      };

      DocumentReference Product = firestore.collection('product').doc(id);
      await Product.update(productData);

      Get.defaultDialog(title: 'Alert', middleText: 'berhasil menupdate data');
      // Get.offNamed(Routes.product_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menupdate data');
      print(e);
    }
  }

  deleteData(String id) async {
    try {
      DocumentReference product = firestore.collection('product').doc(id);
      await product.delete();
      Get.defaultDialog(title: 'Alert', middleText: 'berhasil mendelete data');
      return Get.offAllNamed(Routes.PRODUCT_DATA);
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
