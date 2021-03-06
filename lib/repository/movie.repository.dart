import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movity_app/model/movie.list.model.dart';
class MoviesRepository {


  Future<SearchMovieResponse> searchMovies(String query, int page) async{
   
    try{
      
      Uri uri=Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=3fc73fc9f3cd7676a42b50bdf468abf3&query=$query&page=$page");
      Response response= await http.get(uri);
      //print(response.body);
      if(response.statusCode==200){
        //print(response.body);
        return SearchMovieResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Error ${response.statusCode}");
      } }
    catch(ex){
      throw("$ex.toString()");
    }
  }

  Future<List<dynamic>> getGenreMovies() async{
    try{
      Uri uri=Uri.parse("https://api.themoviedb.org/3/genre/movie/list?api_key=3fc73fc9f3cd7676a42b50bdf468abf3");
      Response response= await http.get(uri);
      if(response.statusCode==200){
        return json.decode(response.body);
      } else {
        throw ("Error${response.statusCode}");
      } }
    catch(ex){
      throw("$ex.toString()");
    }
  }

 
 
}