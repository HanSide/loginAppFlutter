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
    final uid = pref.getString("firebase_uid");

    await Future.delayed(const Duration(seconds: 3));

    if (uid != null && uid.isNotEmpty) {
      Get.offAllNamed(AppRoutes.drawerNavPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
