
class MovieVideosModel {
    int id;
    List<Result> results;

    MovieVideosModel({
        required this.id,
        required this.results,
    });

    factory MovieVideosModel.fromJson(Map<String, dynamic> json) => MovieVideosModel(
        id: json["id"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

}

class Result {
    String name;
    String key;
    String site;
    String type;
    bool official;
    String id;

    Result({
        required this.name,
        required this.key,
        required this.site,
        required this.type,
        required this.official,
        required this.id,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        key: json["key"],
        site: json["site"],
        type: json["type"],
        official: json["official"],
        id: json["id"],
    );

   
}