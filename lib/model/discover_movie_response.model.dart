
import 'package:movity_app/model/movie.model.dart';

class DiscoverMovieResponse{
  final List<Movie> ? movies;
  final String error;
  DiscoverMovieResponse(this.movies, this.error);

  DiscoverMovieResponse.fromJson(Map<String, dynamic> json)
  : movies = (json["results"] as List).map((i)=> Movie.fromJson(i)).toList(),
  error = "";
  DiscoverMovieResponse.withError(String errorValue)
  : movies = [], //List()
  error = errorValue;
}