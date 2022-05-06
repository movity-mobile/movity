import 'package:movity_app/model/discover_movie_response.model.dart';
import 'package:dio/dio.dart';

class DiscoverMovieRepository {
  final String apiKey = "6a2bcaf56ba7e9e6ec4fbfd8b5e197a4";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getMoviesUrl = '$mainUrl/discover/movie';
  int total_pages=1;
  Future<DiscoverMovieResponse> discoverMovies(int page) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "sort_by":"popularity.desc",
      "page":page>total_pages?0:page,
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      total_pages = response.data['total_pages'];
      return DiscoverMovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw ("Error : $error stackTrace: $stacktrace");
    }
  }
}