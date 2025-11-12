import 'dart:convert';

import 'package:get/get.dart';
import 'package:latihan111pplg2/model/table_premier_model.dart';
import 'package:http/http.dart' as http;

class TablePremierController extends GetxController {
  var isLoading = false.obs;
  var tableStandings = <Table>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAPITablePremier();
  }

  Future<void> fetchAPITablePremier() async {
    const url =
        "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      print("status code: ${response.statusCode}");
      print("json: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List standings = data['table'];
        tableStandings.assignAll(
          standings.map((e) => Table.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar("error", "Message Error from Server");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
