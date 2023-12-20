import 'dart:convert';

MovieDetailModel movieDetailModelFromJson(String str) => MovieDetailModel.fromJson(json.decode(str));

class MovieDetailModel {
    bool adult;
    String backdropPath;
    int budget;
    List<Genre> genres;
    String homepage;
    int id;
    String overview;
    double popularity;
    String posterPath;
    DateTime releaseDate;
    int revenue;
    String status;
    String tagline;
    String title;
    double voteAverage;
    int voteCount;

    MovieDetailModel({
        required this.adult,
        this.backdropPath = '',
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.overview,
        required this.popularity,
        this.posterPath = '',
        required this.releaseDate,
        required this.revenue,
        required this.status,
        required this.tagline,
        required this.title,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    
}

class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    
}