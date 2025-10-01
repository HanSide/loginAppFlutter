import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/contact_controller.dart';
import 'package:latihan111pplg2/custom_text.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_button.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_input.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: CustomText(
                myText: "Input Contact",
                size: 18,
                type: FontWeight.bold,
              ),
            ),
            
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    controller: controller.nameController,
                    label: "Masukkan nama",
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 55,
                  child: CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.addName();
                    },
                    myTextColor: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    controller: controller.searchController,
                    label: "Cari nama...",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 55,
                  child: CustomButton(
                    text: "Search",
                    onPressed: () {
                      controller.onSearchChanged();
                    },
                    myTextColor: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(() {
                if (controller.filteredNames.isEmpty) {
                  return Center(
                    child: CustomText(
                      myText: "Belum ada data",
                      size: 16,
                      type: FontWeight.normal,
                      myTextColor: Colors.grey,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.filteredNames.length,
                  itemBuilder: (context, index) {
                    final contact = controller.filteredNames[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(contact['name']),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.deleteContact(contact['id']);
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
