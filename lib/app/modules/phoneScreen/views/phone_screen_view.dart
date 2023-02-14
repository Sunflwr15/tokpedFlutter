import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tokopedia/app/controllers/auth_controller.dart';
import 'package:tokopedia/app/modules/splashScreen/config/warna.dart';

import '../controllers/phone_screen_controller.dart';

class PhoneScreenView extends GetView<PhoneScreenController> {
  const PhoneScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final controller = Get.put(PhoneScreenController());
    final auth = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.chevron_left_sharp,
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13.0, top: 10),
                      child: Text(
                        "Login with Phone Number",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 15.0),
                    //   child: Text(
                    //     "Enter the OTP code which we have sent to you!",
                    //     style: TextStyle(color: Colors.black45),
                    //   ),
                    // ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InputText(context, "Email Phone Number", "Enter your email",
                        Icon(null), false, controller.phoneNumber),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: lebar,
                      height: tinggi * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: bgLogin2),
                        child: Text(
                          "Login with phone number",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // auth.resetPassword(controller);
                          // print(controller.email);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

Widget InputText(BuildContext context, String label, String hint, Icon icon,
    final bool, final controller) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              label,
              style: TextStyle(fontSize: 17),
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: bool,
            decoration: InputDecoration(
                // label: Text(label),
                hintText: hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 3, color: Colors.black45))),
          )
        ],
      ),
    ),
  );
}
