import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/modules/splashScreen/config/warna.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final controller = Get.put(LoginScreenController());
    return Obx(() => Scaffold(
            body: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 13.0),
                child: Text(
                  "Hi, Welcome Back!👋",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Text(
                  "Hello again, you've been missed",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      InputText(context, "Email Address", "Enter your email",
                          controller.ChangeEye(), Icon(null), false),
                      InputText(
                          context,
                          "Password",
                          "Enter your password",
                          controller.ChangeEye(),
                          controller.showPass.value
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                          controller.showPass.value),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
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
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Get.toNamed("/home");
                        print("GO");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Center(child: Text("Or Login With")),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: lebar * 0.4,
                        height: tinggi * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/image/Facebook.png",
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: lebar * 0.4,
                        height: tinggi * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border:
                                Border.all(width: 2, color: Colors.black45)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/image/Google.png",
                            ),
                            Text(
                              "Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )));
  }
}

Widget InputText(BuildContext context, String label, String hint,
    void controller, Icon icon, final bool) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //     padding: const EdgeInsets.only(bottom: 10.0),
          //     child: Text(
          //       label,
          //       style: TextStyle(fontSize: 17),
          //     ),
          //   ),
          TextFormField(
            // controller: controller,
            obscureText: bool,
            decoration: InputDecoration(
                label: Text(label),
                hintText: hint,
                suffixIcon: IconButton(onPressed: () => controller, icon: icon),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 3, color: Colors.black45))),
          )
        ],
      ),
    ),
  );
}
