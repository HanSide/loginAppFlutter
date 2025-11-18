import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan111pplg2/model/anime_Top_model.dart';
import 'package:latihan111pplg2/model/anime_season_now_model.dart';

class AnimeController extends GetxController{
var isLoading = false.obs;
var topAnime = <AnimeTop>[].obs;
var seasonNow = <SeasonAnime>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit(); 
    fetchAll();
  }
Future<void> fetchAll() async {
  try {
    isLoading.value = true;

    final responses = await Future.wait([
      http.get(Uri.parse("https://api.jikan.moe/v4/seasons/now")),
      http.get(Uri.parse("https://api.jikan.moe/v4/top/anime")),
    ]);

    final seasonData =
        SeasonNowList.fromJson(jsonDecode(responses[0].body));
    final topData =
        AnimeTopList.fromJson(jsonDecode(responses[1].body));

    seasonNow.value = seasonData.data;
    topAnime.value = topData.data;
  } finally {
    isLoading.value = false;
  }
}
}