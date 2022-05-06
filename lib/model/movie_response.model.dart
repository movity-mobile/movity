import 'package:movity_app/model/home.movies.model.dart';

class MovieResponse{
  final List<HomeMovie> ? movies;
  final String error;
  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
  : movies = (json["results"] as List).map((i)=> new HomeMovie.fromJson(i)).toList(),
  error = "";
  MovieResponse.withError(String errorValue)
  : movies = [], //List()
  error = errorValue;
}