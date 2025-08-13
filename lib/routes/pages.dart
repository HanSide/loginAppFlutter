import 'package:get/get_navigation/get_navigation.dart';
import 'package:latihan111pplg2/pages/calculator_page.dart';
import 'package:latihan111pplg2/pages/football_editplayer.dart';
import 'package:latihan111pplg2/pages/football_player.dart';
import 'package:latihan111pplg2/routes/routes.dart';

class AppPage{
  static final pages =[
    GetPage(name: AppRoutes.calculatorPage, page: ()=> CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: ()=> FootballPlayer()),
    GetPage(name: AppRoutes.footballEditPlayer, page: () => FootballEditplayer()),
  ];
}