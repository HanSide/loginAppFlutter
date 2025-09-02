import 'package:get/get_navigation/get_navigation.dart';
import 'package:latihan111pplg2/pages/drawer_nav_page.dart';
import 'package:latihan111pplg2/pages/calculator_page.dart';
import 'package:latihan111pplg2/pages/football_editplayer_page.dart';
import 'package:latihan111pplg2/pages/football_player.dart';
import 'package:latihan111pplg2/pages/profile_page.dart';
import 'package:latihan111pplg2/routes/routes.dart';

class AppPage{
  static final pages =[
    GetPage(name: AppRoutes.calculatorPage, page: ()=> CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: ()=> FootballPlayer()),
    GetPage(name: AppRoutes.footballEditPlayer, page: () => FootballEditplayer()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.drawerNavPage, page: () => DrawerNavPage()),
  ];
}