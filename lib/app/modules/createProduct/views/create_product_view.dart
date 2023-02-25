// import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/product_controller.dart';

import '../../splashScreen/config/warna.dart';
import '../controllers/create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  const CreateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final controller = CreateProductController();
    final productC = ProductController();
    return Obx(() => SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                    width: lebar,
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [bgLogin, bgHeader]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Center(
                      child: Text(
                        "Create Slider",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Column(
                      children: [
                        // ElevatedButton(
                        //     onPressed: () {
                        //       controller.uploadGambar();
                        //     },
                        //     child: Text("Upload Photo")),
                        CustomInput(
                            controller: controller.image,
                            label: 'Image',
                            hint: 'Insert Image',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.title,
                            label: 'Title',
                            hint: 'Insert Title',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.price,
                            label: 'Price',
                            hint: 'Insert Price',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.description,
                            label: 'Description',
                            hint: 'Insert Description',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.adress,
                            label: 'Address',
                            hint: 'Insert Address',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.stock,
                            label: 'Stock',
                            hint: 'Insert Stock',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.store,
                            label: 'Store Name',
                            hint: 'Insert Stock',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.discount,
                            label: 'Add Discount',
                            hint: 'Insert Discount',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Aktifasi Slider",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Switch(
                                      value: controller.status.value,
                                      onChanged: (value) =>
                                          controller.changeActivation()),
                                ],
                              ),
                              Text(
                                controller.status.value
                                    ? "Merchant"
                                    : "Official Store",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: controller.status.value
                                        ? bgHeader
                                        : Colors.red,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  margin: EdgeInsets.only(top: 40),
                  child: InkWell(
                    onTap: () {
                      productC.addData(
                          controller.store.text,
                          controller.title.text,
                          controller.image.text,
                          controller.description.text,
                          int.parse(controller.price.text),
                          int.parse(controller.discount.text),
                          controller.adress.text,
                          // int.parse(controller.rate.text),
                          controller.rate,
                          int.parse(controller.stock.text),
                          // int.parse(controller.sold),
                          controller.sold,
                          controller.status.value);
                    },
                    child: Container(
                      width: lebar,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: bgHeader),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Buat Slider',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))));
  }
}

Widget CustomInput({label, controller, obscure, hint, icon}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        child: TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
            )),
      ),
    ],
  );
}
