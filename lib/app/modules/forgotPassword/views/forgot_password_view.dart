import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tokopedia/app/modules/splashScreen/config/warna.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final controller = Get.put(ForgotPasswordController());
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
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InputText(context, "Email Address", "Enter your email",
                        Icon(null), false),
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
                          "Send Instructions",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Get.toNamed("/verification");
                          print("GO");
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

Widget InputText(
    BuildContext context, String label, String hint, Icon icon, final bool) {
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
            // controller: controller,
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
