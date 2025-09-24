import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login() async {
    if (usernameController.text == "admin" && passwordController.text == "admin") {
      final pref = await SharedPreferences.getInstance();
      pref.setString("Username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.drawerNavPage);
    } else {
      Get.snackbar("Error", "Username or Password is incorrect");
    }
  }
}