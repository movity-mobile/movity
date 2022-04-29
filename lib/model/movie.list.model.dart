import 'package:movity_app/model/movie.model.dart';

class SearchMovieResponse {
  int totalResults;
  List<Movie> results;
  SearchMovieResponse(this.totalResults, this.results);

  SearchMovieResponse.fromJson(Map<String,dynamic> json) :
        totalResults = json['total_results'],
        results = (json['results'] as List).map((e) =>
            Movie.fromJson(e)).toList();
}


