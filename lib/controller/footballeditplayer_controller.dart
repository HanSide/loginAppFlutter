import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/footballplayer_controller.dart';
import 'package:latihan111pplg2/model/football_model.dart';

class EditPlayer extends GetxController {
  final footballcontroller = Get.find<FootballplayerController>();

  final namaPlayerController = TextEditingController();
  final angkaPunggungController = TextEditingController();
  final posisiController = TextEditingController();

  late int index;

  void loadPlayer(int idx) {
    index = idx;
    var player = footballcontroller.players[index];
    namaPlayerController.text = player.namaPlayer;
    angkaPunggungController.text = player.angkaPunggung.toString();
    posisiController.text = player.posisi;
  }

  void updatePlayer() {
    final updatedPlayer = PlayerModel(
      profileImage: footballcontroller.players[index].profileImage,
      namaPlayer: namaPlayerController.text,
      posisi: posisiController.text,
      angkaPunggung: int.tryParse(angkaPunggungController.text) ?? 0,
    );
    footballcontroller.players[index] = updatedPlayer;
  }

  @override
  void onClose() {
    namaPlayerController.dispose();
    posisiController.dispose();
    angkaPunggungController.dispose();
    super.onClose();
  }
}
