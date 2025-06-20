class Movie{
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;

  Movie({
  required this.id,
  required this.title,
  required this.overview,
  required this.posterPath,
  required this.voteAverage,
  required this.releaseDate,
});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"] ?? '',
        voteAverage: (json["vote_average"] as num).toDouble(),
        releaseDate: json["release_date"] ?? '',
  );
}