import 'package:get/get.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }


  checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    if(pref.getString("Username") != null){
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.drawerNavPage);
    }
    else{
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}