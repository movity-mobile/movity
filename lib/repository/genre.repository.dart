import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movity_app/model/movie.list.model.dart';
class GenresRepository {
  Future<SearchMovieResponse> searchMoviesByGenre(String genre, int page) async{
    try{
      Uri uri=Uri.parse("https://api.themoviedb.org/3/discover/movie?api_key=3fc73fc9f3cd7676a42b50bdf468abf3&with_genres=$genre&page=$page");
      Response response= await http.get(uri);
      if(response.statusCode==200){
        return SearchMovieResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Error ${response.statusCode}");
      } }
    catch(ex){
      throw("$ex.toString()");
    }
  }
}