import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/anime_controller.dart';

class AnimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeController>(() => AnimeController(), fenix: true);
  }
}
