import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../pages/calculator_page.dart';
import '../pages/football_player.dart';
import '../pages/profile_page.dart';

class DrawerNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPlayer(),
    ProfilePage(),
  ];

  final List<Map<String, dynamic>> menuItems = const [
    {"title": "Calculator", "icon": Icons.calculate},
    {"title": "Football", "icon": Icons.sports_soccer_rounded},
    {"title": "Profile", "icon": Icons.person},
 ];
}
