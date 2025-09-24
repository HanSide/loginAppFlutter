import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/calculator_controller.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_button.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_input.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  // final CalculatorController calculatorController = Get.put(
  //   CalculatorController(),
  // );

  final calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF0F6),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Kalkulator GetX',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomInputField(
                  controller: calculatorController.txtangka1,
                  label: "Masukkan Angka Pertama",
                ),
                const SizedBox(height: 12),
                CustomInputField(
                  controller: calculatorController.txtangka2,
                  label: "Masukkan Angka Kedua",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton1(
                      text: "+",
                      myTextColor: TextStyle(color: Colors.white),
                      onPressed: () => calculatorController.tambah(),
                    ),
                    CustomButton1(
                      text: "-",
                      myTextColor: TextStyle(color: Colors.white),
                      onPressed: () => calculatorController.kurang(),
                    ),
                    CustomButton1(
                      text: "×",
                      myTextColor: TextStyle(color: Colors.white),
                      onPressed: () => calculatorController.kali(),
                    ),
                    CustomButton1(
                      text: "÷",
                      myTextColor: TextStyle(color: Colors.white),
                      onPressed: () => calculatorController.bagi(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Obx(
                  () => Text(
                    "Hasil: ${calculatorController.textHasil.value}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Hapus",
                  myTextColor: Colors.white,
                  onPressed: () => calculatorController.clear(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
