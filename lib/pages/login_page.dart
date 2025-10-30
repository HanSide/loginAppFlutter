import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/login_api_controller.dart';
import 'package:latihan111pplg2/custom_text.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_button.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color(0xFFEAF0F6),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomText(
              myText: "Please Enter Your Username And Password",
              size: 15,
              type: FontWeight.normal,
            ),

            CustomInputField(
              controller: controller.usernameController,
              label: "Username",
            ),
            CustomInputField(
              controller: controller.passwordController,
              label: "Password",
              isPassword: true,
            ),

            const SizedBox(height: 20),

            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : CustomButton1(
                      text: "Login",
                      myTextColor: const TextStyle(color: Colors.blue),
                      onPressed: () {
                        controller.login();
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
