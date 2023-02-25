import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller.dart';
import 'package:tokopedia/app/modules/splashScreen/config/warna.dart';

import '../../../controllers/slider_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final logController = Get.put(AuthController());
    final sliderC = Get.put(SliderController());
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: tinggi * 0.16,
          decoration: BoxDecoration(color: bgNav),
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: lebar * 0.45,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black38),
                      hintText: "Uniqlo air",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                width: lebar * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    Image.asset(
                      "assets/image/shopping-cart 1.png",
                    ),
                    Image.asset(
                      "assets/image/Group 19.png",
                    ),
                    InkWell(
                      onTap: () => logController.logOut(),
                      child: Image.asset(
                        "assets/image/menu 1.png",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        FutureBuilder<QuerySnapshot<Object?>>(
            future: sliderC.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var listData = snapshot.data!.docs;
                // return Text(listData.toString());
                return Container(
                  width: lebar,
                  height: tinggi * 0.15,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: tinggi * 0.12,
                        autoPlay: true,
                        pageSnapping: true),
                    items: listData.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: tinggi,
                            width: lebar,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage((i.data() as Map<String,
                                            dynamic>)["image_slider"]
                                        .toString()),
                                    fit: BoxFit.cover)),
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              } else {
                return SizedBox(height: tinggi * 0.15);
              }
            }),
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: lebar,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      Menu(
                          image: "assets/image/cr.png",
                          text: "Promo Hari Ini",
                          context: context),
                      Menu(
                          image: "assets/image/toserba.png",
                          text: "Toserba",
                          context: context),
                      Menu(
                          image: "assets/image/elektronik.png",
                          text: "Elektronik",
                          context: context),
                      Menu(
                          image: "assets/image/tagihan.png",
                          text: "Top-up & Tagihan",
                          context: context),
                      Menu(
                          image: "assets/image/cod.png",
                          text: "Lihat Semua",
                          context: context),
                      Menu(
                          image: "assets/image/official.png",
                          text: "Official Store",
                          context: context),
                      Menu(
                          image: "assets/image/play.png",
                          text: "Live Shopping",
                          context: context),
                      Menu(
                          image: "assets/image/seru.png",
                          text: "Tokopedia Seru",
                          context: context),
                      Menu(
                          image: "assets/image/cod.png",
                          text: "Bayar Ditempat",
                          context: context),
                      Menu(
                          image: "assets/image/bangga.png",
                          text: "Bangga Lokal",
                          context: context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text("Kejar Diskon Special",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: bgJudul)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Berakhir dalam",
                                    style: TextStyle(
                                        fontSize: 12, color: bgSubJudul)),
                                Jam()
                              ],
                            ),
                            Text("Lihat Semua", style: TextStyle(color: bgNav)),
                          ],
                        )
                      ]),
                ),
              ],
            )),
        Container(
            width: lebar,
            height: tinggi * 0.4,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [bgDiskon, bgDiskon2])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/image/diskon.png",
                  fit: BoxFit.cover,
                  // scale: 1.15,
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: diskonCard(
                        lebar * 0.37,
                        tinggi * 0.38,
                        "assets/image/diskonproduk1.png",
                        "Rp. 40.000",
                        "Rp. 70.000",
                        "Kota Bandung"))
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pilihan Promo Hari Ini",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: bgJudul)),
                      Text("Lihat Semua", style: TextStyle(color: bgNav)),
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    spacing: 15.0,
                    children: [
                      Image.asset("assets/image/diskonBanner.png"),
                      Image.asset("assets/image/diskonBanne2.png"),
                    ],
                  ),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Produk Pilihan Hari Ini",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: bgJudul)),
              Text("Lihat Semua", style: TextStyle(color: bgNav)),
            ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 10,
                    direction: Axis.horizontal,
                    children: [
                      productCard(
                          lebar * 0.37,
                          tinggi * 0.44,
                          "assets/image/produkPilihan1.png",
                          "Logitech G603 Lightspeed ...",
                          "Rp. 200.000",
                          "Rp. 250.000",
                          "Kab. Tangerang",
                          "4.8",
                          "68"),
                      productCard(
                          lebar * 0.37,
                          tinggi * 0.44,
                          "assets/image/produkPilihan2.png",
                          "Logitech G603 Lightspeed ...",
                          "Rp. 200.000",
                          "Rp. 250.000",
                          "Kab. Tangerang",
                          "4.8",
                          "68"),
                      productCard(
                          lebar * 0.37,
                          tinggi * 0.44,
                          "assets/image/produkPilihan3.png",
                          "Logitech G603 Lightspeed ...",
                          "Rp. 200.000",
                          "Rp. 250.000",
                          "Kab. Tangerang",
                          "4.8",
                          "68"),
                    ]),
              ),
            )
          ]),
        ),
        Container(
          width: lebar,
          padding: EdgeInsets.fromLTRB(20, 10.0, 20, 10),
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 10,
                    direction: Axis.horizontal,
                    children: [
                      Kategori(grad1, grad1_2, "For Gathfan"),
                      Kategori(grad2, grad2_2, "Special Discount"),
                      Kategori(grad3, grad3_2, "Your Activity"),
                      Kategori(grad4, grad4_2, ""),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    runSpacing: 12,
                    spacing: 12,
                    children: [
                      productCard(
                          lebar * 0.43,
                          tinggi * 0.47,
                          "assets/image/produk1.png",
                          "Monitor Lenovo G34W-30 34 ...",
                          "Rp. 30.000",
                          "Rp. 600.000",
                          "Cibedug",
                          "5.0",
                          "100"),
                      productCard(
                          lebar * 0.43,
                          tinggi * 0.47,
                          "assets/image/produk2.png",
                          "Myvo Steker T Multi Lampu Colokan ...",
                          "Rp. 30.000",
                          "Rp. 600.000",
                          "Cibedug",
                          "5.0",
                          "100"),
                      productCard(
                          lebar * 0.43,
                          tinggi * 0.47,
                          "assets/image/produk3.png",
                          "Logitech G PRO X SUPERLIGHT ...",
                          "Rp. 30.000",
                          "Rp. 600.000",
                          "Cibedug",
                          "5.0",
                          "100"),
                      productCard(
                          lebar * 0.43,
                          tinggi * 0.47,
                          "assets/image/produk4.png",
                          "SteelSeries Rival 3 Wireless - Gaming ...",
                          "Rp. 30.000",
                          "Rp. 600.000",
                          "Cibedug",
                          "5.0",
                          "100"),
                    ]),
              ),
              Container(
                width: lebar,
                height: tinggi * 0.09,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Lihat Selengkapnya"),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}

Widget Kategori(Color color1, Color color2, String text) {
  return Container(
    width: 100,
    height: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [color1, color2])),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget productCard(
    final width,
    final height,
    String image,
    String judul,
    String harga,
    String hargaAwal,
    String Lokasi,
    String rate,
    String terjual) {
  return Container(
    width: width,
    height: height,
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
      Image.asset(
        image,
        // height: height / 1,
        width: width,
      ),
      Container(
          height: height * 0.48,
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(judul, style: TextStyle(fontWeight: FontWeight.normal)),
              Text(harga, style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: bgHarga, borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "16%",
                      style: TextStyle(
                          fontSize: 10,
                          color: bgJam,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    hargaAwal,
                    style: TextStyle(
                        fontSize: 10, decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
              Row(children: [
                Image.asset(
                  "assets/image/power_merchant_badge.png",
                  scale: 1,
                ),
                Text(Lokasi,
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
                  Text(rate,
                      style: TextStyle(
                        fontSize: 10,
                      )),
                  Text("|"),
                  Text("${terjual} Terjual",
                      style: TextStyle(
                        fontSize: 10,
                      )),
                ],
              ),
            ],
          ))
    ]),
  );
}

Widget diskonCard(final width, final height, String image, String harga,
    String hargaAwal, String Lokasi) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        image,
        // height: height / 1,
        width: width,
      ),
      Container(
          height: height * 0.4,
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(harga, style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: bgHarga, borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "16%",
                      style: TextStyle(
                          fontSize: 10,
                          color: bgJam,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    hargaAwal,
                    style: TextStyle(
                        fontSize: 10, decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
              Row(children: [
                Image.asset(
                  "assets/image/official.png",
                  scale: 2,
                ),
                Text(Lokasi,
                    style: TextStyle(
                      fontSize: 10,
                    )),
              ]),
              Text("Segera Habis",
                  style: TextStyle(
                    fontSize: 10,
                  )),
            ],
          ))
    ]),
  );
}

Widget Jam() {
  return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      decoration: BoxDecoration(
          color: bgJam, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              CupertinoIcons.time,
              color: Colors.white,
              size: 12,
            ),
          ),
          Text(
            "00 : 15 : 29",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ));
}

Widget Menu({image: String, text: String, context: BuildContext}) {
  double lebar = MediaQuery.of(context).size.width;
  return Container(
      margin: EdgeInsets.only(top: 10),
      width: lebar * 0.15,
      child: Column(
        children: [
          Image.asset(image),
          Text(
            text,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ));
}
