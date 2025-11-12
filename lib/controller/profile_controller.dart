import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan111pplg2/controller/login_api_controller.dart';

class ProfileController extends GetxController {
  final loginController = Get.find<LoginApiController>();

  Future<void> logout() async {
    await loginController.signOut();
  }
}
