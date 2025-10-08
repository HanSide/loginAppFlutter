import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/footballplayer_controller.dart';
import 'package:latihan111pplg2/routes/routes.dart';

class FootballWidescreen extends StatelessWidget {
  FootballWidescreen({super.key});

  final FootballplayerController footballplayerController = Get.put(
    FootballplayerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Football Players Widescreen",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Obx(
          () => ListView.builder(
            itemCount: footballplayerController.players.length,
            itemBuilder: (context, index) {
              final player = footballplayerController.players[index];
              return Card(
                margin: EdgeInsets.only(bottom: 24),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  leading: CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(player.profileImage),
                  ),
                  title: Text(
                    player.namaPlayer,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Posisi: ${player.posisi}, Angka Punggung: ${player.angkaPunggung}",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, size: 28),
                    onPressed: () {
                      Get.toNamed(AppRoutes.footballEditPlayer, arguments: index);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
