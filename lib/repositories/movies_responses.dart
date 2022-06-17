class MovieResponse {
  final List<GenresEntity>? genresEntity;
  final int? id;
  final String? original_title;
  final String? overview;
  final String? release_date;

  MovieResponse({
    this.genresEntity,
    this.id,
    this.original_title,
    this.overview,
    this.release_date,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    final list = json["genres"] as List;
    List<GenresEntity> genresList = [];
    list.forEach((element) {
      genresList.add(GenresEntity.fromJson(element));
    });

    return MovieResponse(
      genresEntity: genresList,
      id: json['id'] as int,
      original_title: json['original_title'] as String,
      overview: json['overview'] as String,
      release_date: json['release_date'] as String,
    );
  }
}

class GenresEntity {
  final int? id;
  final String? name;

  GenresEntity({this.id, this.name});

  factory GenresEntity.fromJson(Map<String, dynamic> json) {
    return GenresEntity(
      id: json["id"],
      name: json["name"],
    );
  }
}
