import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/table_premier_controller.dart';

class TablePremierBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TablePremierController());
  }
}