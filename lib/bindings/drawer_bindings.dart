import 'package:get/get.dart';
import 'package:latihan111pplg2/bindings/table_premier_binding.dart';
import 'package:latihan111pplg2/controller/anime_controller.dart';
import 'package:latihan111pplg2/controller/calculator_controller.dart';
import 'package:latihan111pplg2/controller/contact_controller.dart';
import 'package:latihan111pplg2/controller/footballplayer_controller.dart';
import 'package:latihan111pplg2/controller/login_api_controller.dart';
import 'package:latihan111pplg2/controller/profile_controller.dart';
import 'package:latihan111pplg2/controller/table_premier_controller.dart';

class DrawerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballplayerController>(() => FootballplayerController());
    Get.lazyPut<CalculatorController>(
      () => CalculatorController(),
      fenix: true,
    );
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<TablePremierController>(() => TablePremierController());
    Get.lazyPut<LoginApiController>(() => LoginApiController());
    Get.lazyPut<AnimeController>(() => AnimeController(), fenix: true);
  }
}
