import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/dbhelper/dbhelper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

 final names = <Map<String, dynamic>>[].obs;
 final filteredNames = <Map<String, dynamic>>[].obs;


  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.assignAll(data);
    filteredNames.assignAll(names);
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> deleteContact(int index) async {
    await _dbHelper.deleteName(index);
    fetchNames();
  }

  void onSearchChanged() {
    final lowerQuery = searchController.text.toLowerCase();
    if (lowerQuery.isEmpty) {
      filteredNames.assignAll(names);
    } else {
      filteredNames.assignAll(
        names
            .where(
              (contact) => (contact['name'] as String).toLowerCase().contains(
                lowerQuery,
              ),
            )
            .toList(),
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    searchController.dispose();
    super.onClose();
  }
}
