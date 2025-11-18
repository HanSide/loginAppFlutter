class SeasonNowList {
  final List<SeasonAnime> data;

  SeasonNowList({required this.data});

  factory SeasonNowList.fromJson(Map<String, dynamic> json) {
    return SeasonNowList(
      data: (json['data'] as List)
          .map((x) => SeasonAnime.fromJson(x))
          .toList(),
    );
  }
}

class SeasonAnime {
  final int malId;
  final String title;
  final String? imageUrl;
  final String? status;
  final double? score;

  SeasonAnime({
    required this.malId,
    required this.title,
    this.imageUrl,
    this.status,
    this.score,
  });

  factory SeasonAnime.fromJson(Map<String, dynamic> json) {
    return SeasonAnime(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['images']?['jpg']?['image_url'],
      status: json['status'],
      score: (json['score'] as num?)?.toDouble(),
    );
  }
}
