
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/example_controller.dart';

class ExampleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}