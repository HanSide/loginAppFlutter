import 'package:get/get.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  
  logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('Username');
    Get.offAllNamed(AppRoutes.splashscreenPage);
  }
}
