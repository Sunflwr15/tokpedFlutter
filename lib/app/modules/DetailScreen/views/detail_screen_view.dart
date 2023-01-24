import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../splashScreen/config/warna.dart';
import '../controllers/detail_screen_controller.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  const DetailScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: lebar,
        height: tinggi,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: tinggi * 0.16,
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.chevron_left_outlined),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: lebar * 0.5,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(color: Colors.black38),
                            hintText: "Uniqlo air",
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Container(
                      width: lebar * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Image.asset("assets/image/detail_minyak_wangi.png"),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp370.000",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.favorite_border_outlined)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "Mine. Perfumery ETHEREAL - 50ml Eau De Parfum",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            spacing: 10,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text("Terjual 250+"),
                              ),
                              Container(
                                width: lebar * 0.26,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black26),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.star,
                                        color: bgBintang, size: 14),
                                    Text("4.9 (320)"),
                                  ],
                                ),
                              ),
                              Container(
                                width: lebar * 0.35,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black26),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("Foto Pembeli (70)")),
                              ),
                              Container(
                                width: lebar * 0.28,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black26),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("Diskusi (20)")),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
              divider(lebar, tinggi * 0.01),
              Container(
                padding: EdgeInsets.all(20.0),
                width: lebar,
                height: tinggi * 0.2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Detail produk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 100,
                        children: [
                          Text(
                            "Berat Satuan",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Text(
                            "200 g",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          )
                        ],
                      ),
                      divider(lebar, tinggi * 0.002),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 130,
                        children: [
                          Text(
                            "Etalase",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Text("Mine Private Collection",
                              style: TextStyle(
                                  color: bgNav, fontWeight: FontWeight.bold))
                        ],
                      ),
                      divider(lebar, tinggi * 0.002),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                  bottom: 20.0,
                ),
                width: lebar,
                height: tinggi * 0.2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deskripsi produk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                          "Mine. ETHEREAL Eau De Parfum 50mi glass perfume bottle in hard box packaging • ETHEREAL • With facets that highlight a side ..."),
                      Text("Baca Selengkapnya",
                          style: TextStyle(
                              color: bgNav, fontWeight: FontWeight.bold))
                    ]),
              ),
              divider(lebar, tinggi * 0.002),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/image/profile_parfume.png'),
                        SizedBox(
                          width: lebar * 0.015,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/image/official.png',
                                    width: 18),
                                Text(
                                  ' Mine. Parfumery',
                                  style: TextStyle(
                                      color: bgJudul,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(
                              height: tinggi * 0.01,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Online',
                                  style: TextStyle(color: bgSubJudul),
                                ),
                                TextSpan(
                                  text: ' 23 Jam lalu',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: bgSubJudul),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: tinggi * 0.006,
                            ),
                            Text('Kota Tangerang'),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: lebar * 0.2,
                      height: 37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: bgNav)),
                      child: Text(
                        'Follow',
                        style: TextStyle(
                            color: bgNav,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              divider(lebar, tinggi * 0.01),
              Container(
                width: lebar,
                height: tinggi * 0.5,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lainnya di toko ini",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text("Lihat Semua",
                              style: TextStyle(
                                  color: bgNav, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: [
                            productCard(
                                lebar * 0.35,
                                tinggi * 0.4,
                                "assets/image/anotherProduct2.png",
                                "Mine. Perfumery TATMI - 50ml ...",
                                "Rp 450.000",
                                "Kota Tangerang",
                                "4.5",
                                "200"),
                            productCard(
                                lebar * 0.35,
                                tinggi * 0.4,
                                "assets/image/anotherProduct1.png",
                                "Mine. Perfumery FLORAISON ...",
                                "Rp 370.000",
                                "Kota Tangerang",
                                "4.5",
                                "200"),
                            productCard(
                                lebar * 0.35,
                                tinggi * 0.4,
                                "assets/image/anotherProduct1.png",
                                "Mine. Perfumery FLORAISON ...",
                                "Rp 40.000",
                                "Kota Tangerang",
                                "4.5",
                                "200"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              divider(lebar, tinggi * 0.001),
              Container(
                width: lebar,
                height: tinggi * 0.58,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ulasan Pembeli",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text("Lihat Semua",
                              style: TextStyle(
                                  color: bgNav, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Icon(Icons.star, color: bgBintang, size: 20),
                            Text("4.9",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("320 rating ∙ 102 ulasan")
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              children: [
                                Image.asset("assets/image/ProdukComment1.png",
                                    scale: 1.1),
                                Image.asset("assets/image/ProdukComment2.png",
                                    scale: 1.1),
                                Image.asset("assets/image/ProdukComment3.png",
                                    scale: 1.1),
                                Image.asset("assets/image/ProdukComment4.png",
                                    scale: 1.1),
                                Image.asset("assets/image/produkPlus.png",
                                    scale: 1.1),
                              ],
                            ),
                          ),
                        ),
                        divider(lebar, tinggi * 0.001),
                        Container(
                            width: lebar,
                            padding: EdgeInsets.only(top: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 20,
                                    children: [
                                      Image.asset(
                                          "assets/image/profilePic1.png"),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Zain Ekstrom Bothman",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "31 ulasan lengkap ∙ 17 terbantu",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: bgSubJudul))
                                        ],
                                      )
                                    ]),
                                Container(
                                  height: tinggi * 0.18,
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(spacing: 3, children: [
                                        Icon(Icons.star,
                                            color: bgBintang, size: 17),
                                        Icon(Icons.star,
                                            color: bgBintang, size: 17),
                                        Icon(Icons.star,
                                            color: bgBintang, size: 17),
                                        Icon(Icons.star,
                                            color: bgBintang, size: 17),
                                        Icon(Icons.star,
                                            color: bgBintang, size: 17),
                                        Text("10 bulan yang lalu")
                                      ]),
                                      Text(
                                          "saya selalu tertarik dengan produk lokal, buat saya aroma nomor 2 karena subyektif, Kemasan nomor selanjutnya, tapi yang perlu di",
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text("Lihat Selengkapnya",
                                          style: TextStyle(
                                              color: bgNav,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
              divider(lebar, tinggi * 0.01),
              Container(
                  width: lebar,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Diskusi Pembeli",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text("Lihat Semua",
                              style: TextStyle(
                                  color: bgNav, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          children: [
                            Image.asset("assets/image/profilePic2.png"),
                            Text("Rayna Stanton",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(" ∙ Apr 2022",
                                style:
                                    TextStyle(fontSize: 12, color: bgSubJudul))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "hai! kira-kira kapan restock lagi? thanks in advance",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 30.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          children: [
                            Image.asset("assets/image/profilePic3.png"),
                            Container(
                              margin: EdgeInsets.only(right: 5.0),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: bgIjo,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                "Penjual",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: bgNav,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(" ∙ Apr 2022",
                                style:
                                    TextStyle(fontSize: 12, color: bgSubJudul))
                          ],
                        ),
                      ),
                      Container(
                        height: tinggi * 0.12,
                        padding: EdgeInsets.only(top: 10, left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Halo kak, maaf banget yak karena kamu jadi nunggu, saat ini kita masih out of stock ya ...",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      )
                    ],
                  )),
              divider(lebar, tinggi * 0.01)
            ],
          ),
        ),
      ),
    );
  }
}

Widget productCard(final width, final height, String image, String judul,
    String harga, String Lokasi, String rate, String terjual) {
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
          height: height * 0.53,
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
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: bgIjo, borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      "CASHBACK",
                      style: TextStyle(
                          fontSize: 10,
                          color: bgNav,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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

Widget divider(double lebar, double tinggi) {
  return Container(
    color: Colors.black12,
    width: lebar,
    height: tinggi,
  );
}
