import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/table_premier_controller.dart';

class TablePremierPage extends StatelessWidget {
  TablePremierPage({super.key});
  final controller = Get.find<TablePremierController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Premier League Table")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              await controller.fetchAPITablePremier();
            },
            child: ListView.builder(
              itemCount: controller.tableStandings.length,
              itemBuilder: (context, index) {
                final team = controller.tableStandings[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(team.strBadge),
                    title: Text("${team.intRank}. ${team.strTeam}"),
                    subtitle: Text(
                      "Points: ${team.intPoints} | Played: ${team.intPlayed}",
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
