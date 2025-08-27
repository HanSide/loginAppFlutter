import 'package:get/get.dart';
import 'package:latihan111pplg2/model/football_model.dart';

class FootballplayerController extends GetxController {
  var players = <PlayerModel>[
    PlayerModel(
      namaPlayer: "Amir Fattah",
      angkaPunggung: 10,
      posisi: "Forward",
      profileImage: "assets/images/amir.jpg",
    ),
    PlayerModel(
      namaPlayer: "Faiz 8 BIT",
      angkaPunggung: 7,
      posisi: "Back",
      profileImage: "assets/images/faiz.png",
    ),
    PlayerModel(
      namaPlayer: "Dhiazz Gledek",
      angkaPunggung: 11,
      posisi: "Midfielder",
      profileImage: "assets/images/dhiaz.png",
    ),
  ].obs;
}
