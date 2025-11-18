class AnimeTopList {
  final List<AnimeTop> data;

  AnimeTopList({required this.data});

  factory AnimeTopList.fromJson(Map<String, dynamic> json) {
    return AnimeTopList(
      data: (json['data'] as List).map((item) => AnimeTop.fromJson(item)).toList(),
    );
  }
}

class AnimeTop {
  final int malId;
  final String title;
  final String? imageUrl;
  final double? score;
  final int? rank;

  AnimeTop({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.rank,
  });

  factory AnimeTop.fromJson(Map<String, dynamic> json) {
    return AnimeTop(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['images']?['jpg']?['image_url'],
      score: (json['score'] as num?)?.toDouble(),
      rank: json['rank'],
    );
  }
}
