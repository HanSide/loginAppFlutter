import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/login_controller.dart';
import 'package:latihan111pplg2/custom_text.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_button.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_input.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body : Column(
        children: [
          CustomText(myText: "Please Enter Your Username And Password", size: 15, type: FontWeight.normal),

          CustomInputField(controller: controller.usernameController, label: "Username"),
          CustomInputField(controller: controller.passwordController, label: "Password"),

          CustomButton1(
                      text: "Login",
                      myTextColor: TextStyle(color: Colors.blue),
                      onPressed: () {
                        controller.login();
                      },
                    ),
      
        ],
      ),
    );
  }
}