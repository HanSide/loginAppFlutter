import 'package:get/get.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();

    await pref.remove('token');
    Get.snackbar('Logout', 'Kamu berhasil logout.');

    Get.offAllNamed(AppRoutes.splashscreenPage);
  }
}
