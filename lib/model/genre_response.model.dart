import 'package:movity_app/model/genre_home.model.dart';

class GenreResponse {
  final List<MovieGenre> genres;
  final String error;

  GenreResponse(this.genres, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genres = (json["genres"] as List).map((i)=> new MovieGenre.fromJson(i)).toList(),
  error = "";
  GenreResponse.withError(String errorValue)
  : genres = [],
  error= errorValue;
}
