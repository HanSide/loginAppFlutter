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
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // Logo atau Icon (opsional)
              const Icon(
                Icons.lock_outline,
                size: 80,
                color: Colors.blueAccent,
              ),

              const SizedBox(height: 20),

              // Header Text
              Center(
                child: CustomText(
                  myText: "Selamat Datang!",
                  size: 24,
                  type: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: CustomText(
                  myText: "Login untuk melanjutkan",
                  size: 14,
                  type: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 40),
              CustomInputField(
                controller: controller.emailController,
                label: "Email",
              ),

              CustomInputField(
                controller: controller.passwordController,
                label: "Password",
                isPassword: true,
              ),

              const SizedBox(height: 20),

              Obx(() {
                return controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton1(
                        text: "Login",
                        myTextColor: const TextStyle(color: Colors.white),
                        onPressed: () {
                          controller.signInWithEmail(
                            controller.emailController.text.trim(),
                            controller.passwordController.text.trim(),
                          );
                        },
                      );
              }),

              const SizedBox(height: 30),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomText(
                      myText: "ATAU",
                      size: 14,
                      type: FontWeight.normal,
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 30),

              Obx(() {
                return controller.isLoading.value
                    ? const SizedBox.shrink()
                    : OutlinedButton.icon(
                        onPressed: () {
                          controller.signInWithGoogle();
                        },
                        icon: Image.network(
                          'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg',
                          height: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.login, color: Colors.red);
                          },
                        ),
                        label: const Text(
                          'Login dengan Google',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
              }),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    myText: "Belum punya akun? ",
                    size: 14,
                    type: FontWeight.normal,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/signup');
                    },
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
