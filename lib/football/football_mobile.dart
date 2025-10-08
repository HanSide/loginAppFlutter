import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/footballplayer_controller.dart';

import 'package:latihan111pplg2/routes/routes.dart';

class FootballMobile extends StatelessWidget {
  FootballMobile({super.key});

  final FootballplayerController footballplayerController = Get.put(
    FootballplayerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Football Players", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballplayerController.players.length,
            itemBuilder: (context, index) {
              final player = footballplayerController.players[index];
              return ListTile(
                title: Text(player.namaPlayer),
                subtitle: Text(
                  "Posisi: ${player.posisi}, Angka Punggung: ${player.angkaPunggung}",
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(player.profileImage),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Get.toNamed(AppRoutes.footballEditPlayer, arguments: index);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
