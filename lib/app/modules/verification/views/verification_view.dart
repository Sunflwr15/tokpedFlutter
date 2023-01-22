import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../splashScreen/config/warna.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      width: lebar,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            height: tinggi * 0.7,
            width: lebar * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/image/email.png"),
                Text(
                  "Check Your Email",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'We have sent a password recover instructions to your email.',
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: lebar * 0.4,
                  height: tinggi * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: bgLogin2),
                    child: Text(
                      "Open Email App",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Get.toNamed("/home");
                      print("GO");
                    },
                  ),
                ),
                Text(
                  "Skip, I’ll confirm later",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          Container(
            width: lebar * 0.9,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "Did not receive the email ? Check your spam filter,",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "or try another email address",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: bgLogin),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
