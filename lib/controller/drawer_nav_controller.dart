import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latihan111pplg2/pages/anime_page.dart';
import 'package:latihan111pplg2/pages/contact_page.dart';
import 'package:latihan111pplg2/pages/table_premier_page.dart';
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
    ContactPage(),
    TablePremierPage(),
    AnimePage(),
  ];

  final List<Map<String, dynamic>> menuItems = const [
    {"title": "Calculator", "icon": Icons.calculate},
    {"title": "Football", "icon": Icons.sports_soccer_rounded},
    {"title": "Profile", "icon": Icons.person},
    {"title": "Contact", "icon": Icons.contact_page_rounded},
    {"title": "FootballTeam", "icon": Icons.sports_soccer_rounded},
    {"title": "Anime", "icon": Icons.movie},
  ];
}
