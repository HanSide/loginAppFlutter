import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/footballplayer_controller.dart';
import 'package:latihan111pplg2/football/football_mobile.dart';
import 'package:latihan111pplg2/football/football_widescreen.dart';

class FootballPlayer extends StatelessWidget {
  const FootballPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final footballplayerController = Get.put(FootballplayerController());
          footballplayerController.updateLayout(constraints);
          return Obx(() => footballplayerController.isMobile.value
              ? FootballMobile()
              : FootballWidescreen());
        },
      ),
    );
  }
}
