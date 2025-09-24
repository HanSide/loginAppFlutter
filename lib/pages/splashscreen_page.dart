import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/splashscreen_controller.dart';
import 'package:latihan111pplg2/custom_text.dart';

class SplashscreenPage extends StatelessWidget {
   SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(myText: "Ini SplashScreen", size: 24, type: FontWeight.bold),
      ),
    );
  }
}