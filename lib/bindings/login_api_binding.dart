import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/login_api_controller.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}