import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tokopedia/app/controllers/auth_controller.dart';
import 'package:tokopedia/app/modules/splashScreen/config/warna.dart';

import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  const RegisterScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final controller = Get.put(RegisterScreenController());
    final authController = Get.put(AuthController());
    return Obx(() => Scaffold(
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
                            "Create Account",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            "Connect with your friends today!",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InputText(
                            context,
                            "Email Address",
                            "Enter your email",
                            controller.ChangeEye(),
                            controller.emailAddress,
                            Icon(null),
                            false),
                        // InputText(context, "Phone Number", "Enter your number",
                        //     controller.ChangeEye(), Icon(null), false),
                        PhoneInput(),
                        InputText(
                            context,
                            "Password",
                            "Enter your password",
                            controller.ChangeEye(),
                            controller.password,
                            controller.showPass.value
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                            controller.showPass.value),
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor: bgLogin2),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              authController.register(
                                  controller.emailAddress.text,
                                  controller.password.text);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Center(child: Text("Or Sign Up With")),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                // authController.signInWithFacebook();
                              },
                              child: Container(
                                width: lebar * 0.4,
                                height: tinggi * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2, color: Colors.black45)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                            ),
                            InkWell(
                              onTap: () {
                                authController.signInWithGoogle();
                              },
                              child: Container(
                                width: lebar * 0.4,
                                height: tinggi * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2, color: Colors.black45)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text("Don’t have an account?"),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/login-screen");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: bgLogin2),
                          ),
                        )
                      ]),
                )
              ],
            ),
          )),
        ));
  }
}

Widget PhoneInput() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Mobile Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1, color: Colors.black26)),
        child: Stack(
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                // print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                // print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              // textFieldController: controller,
              formatInput: false,
              maxLength: 12,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              cursorColor: Colors.black,
              inputDecoration: InputDecoration(
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                border: InputBorder.none,
              ),
              // onSaved: (PhoneNumber number) {
              //   print('On Saved: $number');
              // },
            ),
            Positioned(
              left: 90,
              top: 8,
              bottom: 8,
              child: Container(
                height: 40,
                width: 1,
                color: Colors.black.withOpacity(0.13),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget InputText(BuildContext context, String label, String hint,
    void controllerIcon, final controller, Icon icon, final bool) {
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
                label: Text(label),
                hintText: hint,
                suffixIcon:
                    IconButton(onPressed: () => controllerIcon, icon: icon),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 3, color: Colors.black45))),
          )
        ],
      ),
    ),
  );
}
