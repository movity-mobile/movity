import 'package:dio/dio.dart';
import 'dart:math';

import 'package:movity_app/model/random_movies_response.model.dart';

class RandomMovieRepository {
  final String apiKey = "6a2bcaf56ba7e9e6ec4fbfd8b5e197a4";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getMoviesUrl = '$mainUrl/discover/movie';

  Future<RandomMovieResponse> getMovies() async {
    Random random = new Random();
    int randomNumberPage = random.nextInt(20);
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "sort_by":"popularity.desc",
      "page":randomNumberPage,
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return RandomMovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw ("Error : $error stackTrace: $stacktrace");
    }
  }
}