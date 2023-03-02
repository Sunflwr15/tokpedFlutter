// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/product_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../../splashScreen/config/warna.dart';
import '../controllers/product_data_controller.dart';

class ProductDataView extends GetView<ProductDataController> {
  // const ProductDataView({Key? key}) : super(key: key);
  final productC = Get.put(ProductController());
  final homeC = Get.put(ProductDataController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Scaffold(
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: productC.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var listData = snapshot.data!.docs;
              // return ListView.builder(
              //     itemCount: listData.length,
              //     itemBuilder: (context, index) => Container(
              //           // height: tinggi * 0.5,
              //           padding: EdgeInsets.all(10),
              //           width: lebar,
              //           child: Row(
              //             children: [
              //               productCard(
              //                   lebar, tinggi, listData[index], productC),
              //             ],
              //           ),
              //         ));
              return Container(
                width: lebar,
                height: tinggi,
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceEvenly,
                    direction: Axis.horizontal,
                    children: List.generate(
                        listData.length,
                        (index) => productCard(
                            lebar, tinggi, listData[index], productC)),
                  ),
                ),
              );
            } else {
              return (Center(
                child: CircularProgressIndicator(),
              ));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATE_PRODUCT),
        child: Icon(CupertinoIcons.add),
      ),
    )));
  }
}

Widget productCard(final width, final height, final data, final function) {
  int discount =
      int.parse((data.data() as Map<String, dynamic>)['discount'].toString());
  String title = (data.data() as Map<String, dynamic>)['title'].toString();
  String image = (data.data() as Map<String, dynamic>)['image'].toString();
  int price =
      int.parse((data.data() as Map<String, dynamic>)['price'].toString());
  String address = (data.data() as Map<String, dynamic>)['address'].toString();
  String rate = (data.data() as Map<String, dynamic>)['rate'].toString();
  String sold = (data.data() as Map<String, dynamic>)['sold'].toString();
  double ds = discount / 100 * price;
  double realPrice = price - ds;
  return Container(
    width: width * 0.43,
    height: height * 0.38,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color.fromARGB(27, 0, 0, 0),
            blurRadius: 1.0,
            offset: Offset(0.0, 0.0),
            spreadRadius: 1.0)
      ],
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: width,
        height: height * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
      Container(
          height: height * 0.2,
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${title}", style: TextStyle(fontWeight: FontWeight.normal)),
              Text("Rp. ${realPrice}00",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: bgHarga, borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "${discount}%",
                      style: TextStyle(
                          fontSize: 10,
                          color: bgJam,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Rp. ${price}.000",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10,
                        color: bgJam,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Image.asset(
                    "assets/image/power_merchant_badge.png",
                    scale: 1,
                  ),
                ),
                Text("${address}",
                    style: TextStyle(
                      fontSize: 10,
                    )),
              ]),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 3,
                children: [
                  Icon(Icons.star, color: bgBintang, size: 14),
                  Text("${rate}.0",
                      style: TextStyle(
                        fontSize: 10,
                      )),
                  Text("|"),
                  Text("${sold} Terjual",
                      style: TextStyle(
                        fontSize: 10,
                      )),
                ],
              ),
              Container(
                width: width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      function.deleteData(data.id);
                    },
                    child: Text("Hapus Data")),
              )
            ],
          ))
    ]),
  );
}
