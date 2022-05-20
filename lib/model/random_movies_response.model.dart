
import 'package:movity_app/model/movie.model.dart';

class RandomMovieResponse{
  final List<Movie> ? movies;
  final String error;
  RandomMovieResponse(this.movies, this.error);

  RandomMovieResponse.fromJson(Map<String, dynamic> json)
  : movies = (json["results"] as List).map((i)=> Movie.fromJson(i)).toList(),
  error = "";
  RandomMovieResponse.withError(String errorValue)
  : movies = [], //List()
  error = errorValue;
}