import 'package:get/get.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    await Future.delayed(const Duration(seconds: 3));

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.drawerNavPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
