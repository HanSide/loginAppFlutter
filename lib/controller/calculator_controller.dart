
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtangka1 = TextEditingController();
  final txtangka2 = TextEditingController();
  var textHasil = ''.obs;

  void tambah() {
    int angka1 = int.parse(txtangka1.text.toString());
    int angka2 = int.parse(txtangka2.text.toString());
    int hasil = angka1 + angka2;

    print("Hasil Penjumlahan: $hasil");
    textHasil.value = hasil.toString();
  }

  void kurang() {
    int angka1 = int.parse(txtangka1.text.toString());
    int angka2 = int.parse(txtangka2.text.toString());
    int hasil = angka1 - angka2;

    print("Hasil Pengurangan: $hasil");
    textHasil.value = hasil.toString();
  }

  void kali() {
    int angka1 = int.parse(txtangka1.text.toString());
    int angka2 = int.parse(txtangka2.text.toString());
    int hasil = angka1 * angka2;

    print("Hasil Perkalian: $hasil");
    textHasil.value = hasil.toString();
  }

  void bagi() {
    double angka1 = double.parse(txtangka1.text.toString());
    double angka2 = double.parse(txtangka2.text.toString());
    double hasil = angka1 / angka2;

    print("Hasil Pembagian: $hasil");
    textHasil.value = hasil.toString();
  }

  void clear() {
    txtangka1.clear();
    txtangka2.clear();
    textHasil.value = "";
    
  }
}
