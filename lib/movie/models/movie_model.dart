
import 'dart:convert';

MovieResponseModel movieResponseModelFromJson(String str) => MovieResponseModel.fromJson(json.decode(str));

String movieResponseModelToJson(MovieResponseModel data) => json.encode(data);

class MovieResponseModel {
    int page;
    List<MovieModel> results;
    int totalPages;
    int totalResults;

    MovieResponseModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieResponseModel.fromJson(Map<String, dynamic> json) => MovieResponseModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    
}

class MovieModel {
   
    String? backdropPath;
    int id;
    String overview;
    String? posterPath;
    String title;
    double voteAverage;
    int voteCount;

    MovieModel({
        this.backdropPath,
        required this.id,
        required this.overview,
        this.posterPath,
        required this.title,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"] ?? '',
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );


}

enum OriginalLanguage {
    EN,
    HI,
    JA
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "hi": OriginalLanguage.HI,
    "ja": OriginalLanguage.JA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
