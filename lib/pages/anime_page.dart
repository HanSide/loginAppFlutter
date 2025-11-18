import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan111pplg2/controller/anime_controller.dart';
import 'package:latihan111pplg2/widgetdesigned/custom_listview.dart';

class AnimePage extends StatelessWidget {
  AnimePage({super.key});
  final animeController = Get.find<AnimeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (animeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Season Now",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              AnimeListView(items: animeController.seasonNow),

              const SizedBox(height: 25),

              const Text(
                "Top Anime",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              AnimeListView(items: animeController.topAnime),
            ],
          ),
        );
      }),
    );
  }
}
