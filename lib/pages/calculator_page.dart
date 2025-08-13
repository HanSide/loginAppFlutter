import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/calculator_controller.dart';
import 'package:latihan111pplg2/custom_button.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_input1.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF0F6),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Kalkulator GetX', style: TextStyle(color: Colors.white)),
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
                CustomInputField1(
                  controller: calculatorController.txtangka1,
                  label: "Masukkan Angka Pertama",
                ),
                const SizedBox(height: 12),
                CustomInputField1(
                  controller: calculatorController.txtangka2,
                  label: "Masukkan Angka Kedua",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: "+",
                      myTextColor: Colors.blueAccent,
                      onPressed: () => calculatorController.tambah(),
                    ),
                    CustomButton(
                      text: "-",
                      myTextColor: Colors.blueAccent,
                      onPressed: () => calculatorController.kurang(),
                    ),
                    CustomButton(
                      text: "×",
                      myTextColor: Colors.blueAccent,
                      onPressed: () => calculatorController.kali(),
                    ),
                    CustomButton(
                      text: "÷",
                      myTextColor: Colors.blueAccent,
                      onPressed: () => calculatorController.bagi(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Obx(() => Text(
                  "Hasil: ${calculatorController.textHasil.value}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Hapus",
                  myTextColor: Colors.redAccent,
                  onPressed: () => calculatorController.clear(),
                ),
                CustomButton(text: "Main Menu", onPressed: (){
                  Get.toNamed(AppRoutes.footballPage);
                }, myTextColor : Colors.greenAccent)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
