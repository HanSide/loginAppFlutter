import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latihan111pplg2/controller/splashscreen_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}